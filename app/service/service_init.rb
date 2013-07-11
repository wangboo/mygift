module Mygift
  
  module Utils
    def error msg='e'
      '{"_rt":#{msg}}'
    end
    def success map={}
      '{"_rt":"s"}'
    end
  end
  
  services = Dir.new($app_path + "service/")
  services.each do |service|
    require "#{$app_path}/service/#{service}" unless service == "." || service == ".." || service == "service_init.rb"
  end
end