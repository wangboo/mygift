module Mygift
  #帖子，新闻中的回帖
  class Card
    include Mongoid::Document
    #回帖人id
    field :content, type: String
    #顶贴数
    field :good,    type: Integer
    field :create_time, type: Time, default: ->{Time.now}
    belongs_to :user
    belongs_to :news
  end
end