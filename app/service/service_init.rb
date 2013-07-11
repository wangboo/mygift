module Mygift
  services = Dir.new($app_path + "service/")
  services.each do |service|
    require "#{$app_path}/service/#{service}" unless service == "." || service == ".." || service == "service_init.rb"
  end
end