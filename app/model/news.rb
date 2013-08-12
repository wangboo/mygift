#encoding: utf-8
module Mygift
  #新闻
  class News
    include Mongoid::Document
    field :cat_id,  type: Moped::BSON::ObjectId
    field :title,   type: String
    field :abs,     type: String
    field :content, type: String
    field :icon,    type: String
    field :come_from, type: String
    #是否在头版上
    field :is_head, type: Boolean, default: false
    #新闻类型，0普通，1图片集，2文字，带图片集
    field :type,    type: Integer, default: 0
    #是否推送该条新闻
    field :is_push, type: Boolean, default: false
    field :publish_time, type: Time, default: ->{Time.now}
    field :photos, type: Hash
    #种类
    belongs_to :cat
    #回复的帖子
    has_many :cards
    #关联的图片信息
    # has_many :photos
    
    #获的头版的基本信息 hash
    def head_base
      {id: id, icon: icon, title: title, time: publish_time.to_i, type: type}
    end
    
    #获取新闻的基本信息  hash
    def news_base
      head_base
    end
    
    #获取该条新闻的详细信息
    def info_json
      hash = {id: id, icon: icon, title: title, time: publish_time.to_i, type: type}
      hash[:content] = content
      hash[:come_from] = come_from
      hash[:mount] = cards.size
      #查询出所有图片信息
      hash[:photo] = photos
      hash.to_json
    end
    
    def icon_url
      return $adress + icon if icon
      return $adress + "/adv0.jpg"
    end
    
    def type_chinese
      return "普通新闻" if id == 0
      return "图片集"    if id == 1
      return "普通新闻+图片集" if id == 2
      return "未知的新闻类型" 
    end
    
  end
  
end