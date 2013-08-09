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
  News.all.each do |news|
    puts news.info_json
  end
end
