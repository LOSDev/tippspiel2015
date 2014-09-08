class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates_uniqueness_of :username
  scope :ordered, -> { order(points: :desc, rank: :asc) }
  has_many :tipp_groups

  validates :username, length: { in: 3..20 }

end
