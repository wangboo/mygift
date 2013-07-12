$app_path = Dir.pwd
$pro_path = Dir.pwd.gsub(/(.*\/)/).first

load $app_path + "/model/db_init.rb"
load $app_path + "/service/service_init.rb"
require 'sinatra'

get("/account/regist") do
  Mygift::Account.regist params
end

get("/account/login") do
  Mygift::Account.login params
end

get("/account/push_set/") do
  Mygift::Account.push_set params
end
