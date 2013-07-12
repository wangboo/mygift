module Mygift
  class User < ActiveRecord::Base
   def is_guest?
     is_guest == 1
   end
   def is_push?
     is_push == 1
   end
   def is_online?
     is_online == 1
   end
  end
end