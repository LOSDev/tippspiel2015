class TippGroup < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :name, :password
  validates_uniqueness_of :name
end
