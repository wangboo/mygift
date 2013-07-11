module Mygift
  class Account
    class << self
      include Mygift::Utils
      def regist(params)
        unless params[:phone]
          return error
        end
        user = User.new
        if params[:user]
          #包含用户
          user.user = params[:user]
          user.is_guest = 0
          user.pwd = params[:pwd]
          user.nickname = params[:nick]
        else 
          user.user = 'guest'
          user.is_guest = true
        end
        user.phone = params[:phone]
        puts Time.current.to_time
        user.create_time = Time.current.to_time
        user.save!
        success
      end
    end
  end
end