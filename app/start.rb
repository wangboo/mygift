#encoding: utf-8
$app_path = Dir.pwd
$pro_path = Dir.pwd.gsub(/(.*\/)/).first
$res_path = "http://192.168.0.104:4567/res/"

require "mongoid"
require 'sinatra'
require "./sinatra_addon.rb"
require "./utils.rb"
Dir.new("./model/").each do |file|
  require "./model/" << file if file != '.' && file != ".."
end

ENV['RACK_ENV'] = "production"
ENV['MONGOID_ENV'] = 'production'
Mongoid.load!("../config/mongo_config.yml")
enable :sessions

module Mygift
  class App < Sinatra::Base
    class << self
      include Addon
    end
    include Utils
    
    attr_accessor :user
    
    add_server :adv
    add_server :account
    add_server :cat
    add_server :news
    
    add_server :web
    
    #拦截来自手机和网站的的请求
    before do
      path = request.path_info
      return unless path.match(/^\/android\/.*$/)
      @start_time = Time.now
      puts "android用户 path=#{path}"
      puts "params=#{params}"
      #如果入参中包含c，并且c="android"则说明是android用户
      if params.include? "p"
        phone = params["p"]
        all = User.where(:phone => phone)
        #如果该用户不存在,注册
        if all.size == 0
          @user = User.create!(:phone => phone)
        elsif all.size == 1
          @user = all[0]
        else
          #有重复的账号出现，应该使用哪一个账号
          puts "有重复的账号出现 phone = #{@user.phone}"
          @user = all[0]
        end
      end
    end
    
    after do
      return unless @start_time
      end_time = Time.now
      puts "cost #{end_time - @start_time}s"
    end
    
  end
  Rack::Handler::WEBrick.run App, :Port=>3000
end

