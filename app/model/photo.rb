module Mygift
  class Photo
    include Mongoid::Document
    field :icon,    type: String
    field :title,   type: String
    belongs_to :news
    
    #转换出新闻中图片的基本信息 hash
    def to_json
      {:icon=>icon, :title=>title}.to_json
    end
    
  end
end