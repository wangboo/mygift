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
post("/cats") do
  Mygift::NewsService.cats
end

#获取新闻首页内容
post(%r{/cats/(\d+)/main}) do
  Mygift::NewsService.main params
end
#获取新闻内容
post(%r{/news/(\d+)/info}) do
  Mygift::NewsService.info params
end


#广告服务
post("/adv/main") do
  Mygift::AdvService.main
end


#test-----------------------

get("/cats") do
  Mygift::NewsService.cats
end

get(%r{/cats/(\d+)/main}) do
  Mygift::NewsService.main params
end

get(%r{/news/(\d+)/info}) do
  Mygift::NewsService.info params
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