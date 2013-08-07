module Mygift
    #用户
  class User
    include Mongoid::Document
    field :user, type: String, default: "游客"
    field :pwd, type: String, default: ""
    field :nick, type: String, default: "游客"
    field :icon, type: String, default: ""
    field :sex, type: String, default: "未知"
    field :birthday, type: Time
    field :create_time, type: Time, default: ->{Time.now}
    field :phone, type: String
    #最后一次推送的新闻id
    field :last_push_id, type: Moped::BSON::ObjectId
    #最后一次使用该软件时间
    field :last_use_time, type: Time, default: ->{Time.now}
    #级别
    field :level, type: Integer, default: 0
  end
end