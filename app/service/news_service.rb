#encoding: utf-8
module Mygift
  class NewsService
    class << self
      include Mygift::Utils
      
      #寻找前from到to条记录
      def fetch params
        cat_id = params[:captures].first
        # from = params[:from]
        # size = params[:size]
      end
      
      #获取某一个cat的主界面
      def main params
        cat_id = params[:captures].first
        puts "main cat_id = #{cat_id}"
        #获得前4条头版信息
        heads = News.find(:all, :conditions=>["is_head=1 and cat_id=?", cat_id], :order=>"publish_time desc", :limit=>4)
        puts "head size : #{heads.size}"
        head_infos = []
        heads.each do |head|
          head_infos << head.head_base
        end
        result = Hash.new
        result[:head] = head_infos
        #获取前10新闻
        last_news = News.find(:all, :conditions=>["is_head=0 and cat_id=?", cat_id], :order=>"publish_time desc", :limit=>4)
        news_list = []
        last_news.each do |news|
          news_list << news.news_base
        end
        result[:news] = news_list
        success result
      end
      
      #查询新闻种类
      def cats
        all_cats = Cat.all
        list = []
        all_cats.each do |cat|
          list << [cat.id, cat.name]
        end
        success :cats => list
      end
      
      #查询新闻详情
      def info params
        news_id = params[:captures].first
        one_news = News.find_by_id news_id
        return error("第#{news_id}新闻没有找到") unless one_news
        hash = one_news.news_info
        hash.to_json
      end
      
    end
  end
end