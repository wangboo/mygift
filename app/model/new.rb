module Mygift
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
      hash[:mount] = Note.count(:conditions=>["id=?", id])
      hash
    end
    
  end
end