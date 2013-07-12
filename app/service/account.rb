#encoding: utf-8
module Mygift
  class Account
    class << self
      include Mygift::Utils
      
      def regist(params)
        unless params[:phone]
          return error
        end
        if params[:is_guest] == 'true'
          return regist_guest params
        else
          return regist_user params
        end
      end
      
      #重新绑定账号和手机号码
      def login params
        user = params[:user]
        pwd = params[:pwd]
        phone = params[:phone]
        user = User.find_by_user(user, ["pwd=? and phone!=?", pwd, phone])
        if user
          user.phone = phone
          user.save!
        end
      end
      
      def logout params
        
      end
      
      def push_set params
        user = get_user params
      end
      
      private
      #注册游客身份，如果以前该手机注册过游客，则直接返回成功registed = true
      def regist_guest params
        phone = params[:phone]
        #如果该手机存在游客账户，则直接返回成功registed = true
        return success(:registed=>true) if User.find_by_phone(phone, ["is_guest=?", 1])
        #注册
        user = User.new
        user.phone = phone
        user.is_guest = true
        user.level = 0
        user.create_time = Time.current
        user.save!
        success
      end
      
      def regist_user params
#       判断该用户名是否被使用
        error "账号已经被占用" if find_user params
        user = User.new
        user.phone = params[:phone]
        user.is_guest = false
        user.user = params[:user]
        user.pwd = params[:pwd]
        user.push_flag = params[:push_flag] if params[:push_flag]
        user.nick = params[:nick]
        user.create_time = Time.current
      end
        
      
    end
  end
end