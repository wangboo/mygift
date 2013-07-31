#encoding: utf-8
$app_path = Dir.pwd
$pro_path = Dir.pwd.gsub(/(.*\/)/).first
$res_path = "http://192.168.0.104:4567/res/"

load $app_path + "/model/db_init.rb"
load $app_path + "/service/service_init.rb"

ENV['RACK_ENV'] = "production"

require 'sinatra'
enable :sessions

post("/account/regist") do
  Mygift::AccService.regist params
end

get("/account/login") do
  Mygift::AccService.login params
end

get("/account/push_set") do
  Mygift::AccService.push_set params
end

#获取新闻大类
post("/cats") do
  Mygift::NewsService.cats
end

#获取新闻首页内容
post(%r{/cats/(\d+)}) do
  Mygift::NewsService.main params
end
#获取新闻内容
# post(%r{/news/(\d+)/info}) do
  # Mygift::NewsService.info params
# end


#广告服务
post("/adv/main") do
  Mygift::AdvService.main
end

#web =========功能=====================


get("/") do
  erb :login
end

get("/web/main") do
  erb :main
end

#主页
post("/index") do
  return erb :login unless Mygift::WebUser.find_by_user(params[:user], :conditions=>["pwd=?", params[:pwd]])
  @cats = Mygift::Cat.all
  erb :index
end

#增加种类
get("/cats/insert") do 
  cat_name = params[:name]
  cat = Mygift::Cat.new
  cat.name = cat_name
  cat.save!
  erb :main
end

get("/cats/delete") do 
  Mygift::Cat.delete_all(["id=?", params[:id]])
  erb :main
end

get("/web/select/") do
  cats = Mygift::Cat.all
  id = params[:id]
  puts "select id=#{id}"
  cats.each do |cat|
    session[:select_cat_id] = cat.id if (cat.id.to_s == id)
    puts "id=#{id}, find=#{session[:select_cat_id]}, cat.id=#{cat.id}"
  end
  erb :main
end

#增加新闻
post("/news/insert") do
  Mygift::NewsService.insert params
  erb :main
end

#test---------------------------------------------------------------------

get("/cats") do
  Mygift::NewsService.cats
end

get(%r{/cats/(\d+)}) do
  Mygift::NewsService.main params
end

post("/test") do
  hash = {}
  hash[:int] = 1
  hash[:float] = 1.3
  hash[:string] = "string"
  hash[:utf8] = "你好"
  hash[:list] = ["l0", 'l1', {"a"=>"A"}, [1,2,3]]
  hash.to_json
end
get("/test") do
  hash = {}
  hash[:int] = 1
  hash[:float] = 1.3
  hash[:string] = "string"
  hash[:utf8] = "你好"
  hash[:list] = ["l0", 'l1', {"a"=>"A"}, [1,2,3]]
  hash.to_json
end

#广告服务
get("/adv/main") do
  Mygift::AdvService.main
end