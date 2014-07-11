class Prayer < ActiveRecord::Base
  attr_accessible :prayer, :ptype, :public, :user_id
end
