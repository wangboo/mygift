#encoding: utf-8
require "mongoid"
Dir.new("./model/").each do |file|
  require "./model/" << file if file != '.' && file != ".."
end
ENV['MONGOID_ENV'] = 'production'
Mongoid.load!("../config/mongo_config.yml")
# class Hash
  # def compact
    # self
  # end
# end
module Mygift
  cat = Cat.create(name: "test")
  (1..10).each do |i|
    n = News.new(title: "n"+i)
    n.cat = cat
    n.save
  end
  
end