#encoding: utf-8
module Mygift
  module Addon
    #服务配置
    def add_server name
      if name.is_a? Symbol
        filename = "./services/#{name.to_s}.rb"
      elsif name.is_a? String
        if a.match(/^\w+$/)
          filename = "./services/#{name}.rb"
        elsif a.match(/^\w+.\w+$/)
          filename = "./services/#{name}"
        elsif a.match(/^.*\/.*\..*$/)
         filename = name
        end
      else
        raise Error.new "参数错误"
      end
      File.open(filename, "r") do |file|
        class_eval file.read
      end
    end
  end
end