$app_path = __FILE__.gsub(/.*\/app\//).first
$pro_path = __FILE__.gsub(/.*\/xiaonei\//).first
load $app_path + "model/db_init.rb"
load $app_path + "service/service_init.rb"
require 'sinatra'

get("/login") do
  Mygift::Login.login params
end

