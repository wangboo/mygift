#获取新闻内容
#/news?id=
get("/android/news") do
  id = params[:id]
  news = News.find(id)[0]
  return news.info_json if news
  empty
end

#获取从from（包含）开始后的20条数据
get("/android/news/fetch") do
  from = params[:from]
  return error("入参未提供cat") unless params[:cat]
  return error("入参未提供from") unless from
  from = from.to_i
  cat_name = Base64.decode64(params[:cat])
  cats = Cat.where(name: cat_name)
  return error("找不到新闻种类：#{cat_name}") if cat.size == 0
  cat = cats[0]
  News.where(is_head: false, cat_id: cat.id).desc(:publish_time)[from...(20+from)].to_json
end

#创建新闻
post("/web/news/add") do
  puts params
  type = params[:type]
  #0普通文字，1纯图片新闻，2文字＋图片新闻
  cat = Cat.find(params[:cat_id])
  file_path = save_file params[:icon]
  params[:icon] = file_path
  news = News.new(
    cat_id: params[:cat_id],
    title: params[:title],
    abs: params[:abs],
    content: params[:content],
    come_from: params[:come_from],
    type: params[:type]
  );
  news.is_head = true if params[:is_head] == "on"
  news.is_push = true if params[:is_push] == "on"
  news.cat = cat
  if type == "1"
    #纯图片
    photos = {}
    params.each do |key, value|
      if matcher = key.match(/^pic_(\d+)$/)
        id = matcher[1]
        filename = save_file(value)
        photos[params["content_"+id]] = filename
      end
    end
    news.photos = photos
  end
  
  news.save!
  erb :main
end
