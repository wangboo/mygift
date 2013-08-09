#encoding: utf-8
module Mygift
  module Utils
    @@mutex = Mutex.new
    @@last_unique_id = 0
    
    #保存文件，入口参数为params[:file]
    #出口参数为：文件的相对路径/images/upload/.*\.\w+
    def save_file file
      suffix = file[:filename].match(/.*(\.\w+)/)[1]
      save_file = "./public/upload/" + unique_id + suffix
      File.open(save_file, "wb") do |f|
        f.write file[:tempfile].read
        f.close
      end
      save_file.gsub("./public", "")
    end
    
    def unique_id
      begin
        @@mutex.lock
        id = Time.current.to_i
        id+=1 if id == @@last_unique_id
        return id.to_s
      ensure
        @@mutex.unlock
      end
    end
    
    def empty
      "{}"
    end
    
    def success
      {"r" => "s"}.to_json
    end
    
    def error msg
      {"r" => msg}.to_json
    end
    
  end
end