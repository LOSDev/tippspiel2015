class GroupMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :tipp_group
  validates_presence_of :user_id, :tipp_group_id
  validates_uniqueness_of :user_id, scope: [:tipp_group_id]
end
