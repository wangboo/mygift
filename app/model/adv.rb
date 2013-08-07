module Mygift
  #广告模型
  class Adv
    include Mongoid::Document
    field :icon,    type: String
    field :url,     type: String
    field :title,   type: String
    #广告默认超时时间：7天
    field :expire,  type: Time, default: -> {
      now = Time.now
      now = now + 7 * 86400
      now
    }

    def to_json
      {icon: icon, url: url, title: Base64.encode64(title)}.to_json
    end
  end
end



  