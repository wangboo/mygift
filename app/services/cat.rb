#获取新闻大类
get("/android/cat") do
  list = []
  Cat.all.each do |cat|
    list << cat.name
  end
  list.to_json
end

#获取新闻首页内容
post("/android/cat") do
  return error("请求参数不包含name") unless params[:name]
  name = Base64.decode64(params[:name])
  puts "cat name = #{name}"
  #获得前4条头版信息
  all = Cat.where(name: name)
  return empty if all.empty?
  #找对应cat
  cat = all[0]
  #找到头版
  heads = News.where(cat_id: cat.id, is_head: true).desc(:publish_time)[0...5]
  
  head_infos = []
  heads.each do |head|
    head_infos << head.head_base
  end
  result = Hash.new
  result[:head] = head_infos
  #获取前10新闻
  bodies = News.where(cat_id: cat.id, is_head: false).desc(:publish_time)[0...20]
  bodies_list = []
  bodies.each do |body|
    bodies_list << body.news_base
  end
  result[:news] = bodies_list
  result.to_json
end

#删除新闻
post("/web/cat/delete") do
  cat = Cat.find(params[:id])
  cat.news.delete
  cat.delete if cat
  erb :main
end

post("/web/cat/add") do
  Cat.find_or_create_by(name: params[:name])
  erb :main
end

