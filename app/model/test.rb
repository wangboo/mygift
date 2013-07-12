module Mygift
  class Test < ActiveRecord::Base
    def is_guest
      @is_guest == 1
    end
  end
end