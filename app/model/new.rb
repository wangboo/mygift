module Mygift
  #新闻
  class News < ActiveRecord::Base
    
    table_name = :news
    
    #是否是头条显示
    def is_head?
      is_head == 1
    end
    
    #该条新闻是否推送
    def is_push?
      is_push == 1
    end
    
    #获的头版的基本信息 hash
    def head_base
      hash = Hash.new
      hash[:id] = id
      hash[:icon] = big_icon
      hash[:title] = title
      hash[:time] = publish_time.to_i
      hash[:type] = news_type
      hash
    end
    
    #获取新闻的基本信息  hash
    def news_base
      hash = Hash.new
      hash[:id] = id
      hash[:icon] = small_icon
      hash[:title] = title
      hash[:abs] = abstract
      hash[:time] = publish_time.to_i
      hash[:mount] = Note.count(:conditions=>["id=?", id])
      hash
    end
    
    #获取该条新闻的详细信息
    def news_info
      hash = Hash.new
      hash[:id] = id
      hash[:title] = title
      hash[:content] = content
      hash[:time] = publish_time.to_i
      hash[:come_from] = come_from
      hash[:type] = news_type
      hash[:abstract] = abstract
      #查询出所有图片信息
      photos = Photo.find_by_news_id id, :order=>"id asc"
      return hash unless photos
      photo_infos = []
      photos.each do |photo|
        photo_infos << photo.photo_info
      end
      hash[:params] = photo_infos
      hash
    end
    
  end
end