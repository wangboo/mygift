#encoding: utf-8
module Mygift
  class AdvService
    class << self
      include Mygift::Utils

      #查询首界面广告url
      def main
        Adv.last.adv_info.to_json
      end

    end
  end
end