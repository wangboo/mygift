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
