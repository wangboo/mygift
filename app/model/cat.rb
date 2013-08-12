#encoding: utf-8
module Mygift
  #新闻大类
  class Cat
    include Mongoid::Document
    field :name, type: String
    field :create_time, type: Time, default: -> {Time.now} 
    has_many :news
  end
  
end