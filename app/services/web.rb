get "/" do
  erb :login
end

post('/index') do
  puts params
  user = params[:user]
  pwd = params[:pwd]
  return erb :index if user == "root" && pwd == "root"
  erb :login
end

get('/web/main') do
  id = params[:id]
  session[:select_cat_id] = id if id
  erb :main
end

get('/web/news/delete') do
  id = params[:id]
  session[:select_cat_id] = id if id
  erb :news_delete
end

post('/web/news/delete/*') do
  id = params[:splat][0]
  news = News.find(id)
  if news
    delete_file(news.icon)
    news.delete
  end
  erb :news_delete
end


