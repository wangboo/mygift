module Mygift
  
  module Utils
    def error msg=nil
      return '{"_rt":"e"}' if msg == nil
      if msg.is_a? String
        return '{"_rt":"#{msg}"}'
      elsif msg.is_a? Hash
        msg[:_rt] = "e" unless msg.include? :_rt
        return msg.to_json
      end
    end
    
    def success hash=nil
      puts "success : #{hash}"
      return '{"_rt":"s"}' unless hash
      hash[:_rt] = "s"
      hash.to_json
    end
    
    #根据用户名查找用户
    def find_user params
      User.find_by_user params[:user]
    end
    
    alias get_user find_user
  end
  
  services = Dir.new($app_path + "/service/")
  services.each do |service|
    require "#{$app_path}/service/#{service}" unless service == "." || service == ".." || service == "service_init.rb"
  end
end