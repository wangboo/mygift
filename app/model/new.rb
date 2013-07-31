require 'carrierwave'
require 'carrierwave/mount'
require 'carrierwave/orm/activerecord'
module Mygift
  class Uploader < CarrierWave::Uploader::Base
    def store_dir
      'public/res/'
    end
    def filename
      "#{Time.current.to_i}.png"
    end
    def default_url
        "unknown"
    end
  end
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
      if big_icon.is_a? Uploader
        hash[:icon] = $res_path + big_icon.filename 
      else
        hash[:icon] = $res_path + big_icon
      end
      hash[:title] = title
      hash[:time] = publish_time.to_i
      hash[:type] = news_type
      hash
    end
    
    #获取新闻的基本信息  hash
    def news_base
      hash = Hash.new
      hash[:id] = id
      if small_icon.is_a? Uploader
        puts "small_icon is a Uploader ,filename=#{small_icon.url}, #{small_icon}"
        hash[:icon] = $res_path + small_icon.filename
      else
        hash[:icon] = $res_path + small_icon
      end
      hash[:title] = title
      hash[:abs] = abstract
      hash[:time] = publish_time.to_i
      hash[:mount] = Note.count(:conditions=>["news_id=?", id])
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
      hash[:mount] = Note.count(:conditions=>["news_id=?", id])
      if is_head
        hash[:icon] = $res_path + big_icon
      else
        hash[:icon] = $res_path + small_icon
      end
      
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
  
  class NewsUploader < News
    mount_uploader :big_icon, Mygift::Uploader
    mount_uploader :small_icon, Mygift::Uploader
  end
end