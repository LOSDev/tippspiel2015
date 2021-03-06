class TippGroup < ActiveRecord::Base
  belongs_to :user
  has_many :group_members
  has_many :users, through: :group_members
  validates_presence_of :user_id, :name, :password
  validates_uniqueness_of :name

  scope :ordered, -> { order(:name) }
  validates :name, length: { in: 3..20 }
  validates :password, length: { in: 6..20 }

end
