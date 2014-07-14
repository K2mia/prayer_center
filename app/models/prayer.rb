class Prayer < ActiveRecord::Base
  attr_accessible :prayer, :ptype, :public, :anon

  belongs_to :user

  def self.prayer_types
    { 1 => 'Prayer Request', 2 => 'Prayer Reminder' }
  end

end
