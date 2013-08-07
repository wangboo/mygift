require "mongoid"
Dir.new("./model/").each do |file|
  require "./model/" << file if file != '.' && file != ".."
end
ENV['MONGOID_ENV'] = 'production'
Mongoid.load!("../config/mongo_config.yml")
module Mygift
  #Adv.create!(icon: "adv0.jpg", title: "iphone8现已上市")
  start = Time.now
  User.all.each do |user|
    puts user.phone
  end
  puts User.all.size
  last = Time.now
  puts "cost #{last-start}"
end
