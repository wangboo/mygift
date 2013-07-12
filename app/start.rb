#encoding: utf-8
$app_path = Dir.pwd
$pro_path = Dir.pwd.gsub(/(.*\/)/).first

load $app_path + "/model/db_init.rb"
load $app_path + "/service/service_init.rb"

ENV['RACK_ENV'] = "production"

require 'sinatra'

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
post("/news/cats") do
  Mygift::NewsService.cats
end

#获取新闻首页内容
post(%r{/news/(\d+)/main}) do
  Mygift::NewsService.main params
end



#test-----------------------

get("/news/cats") do
  Mygift::NewsService.cats
end

get(%r{/news/(\d+)/main}) do
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

