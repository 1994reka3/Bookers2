class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  attachment :profile_image
  validates :name, presence: true
  validates :email, presence: true
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

# ーーー自分がフォローしているユーザーとの関連ーーーーーーーーーーーー
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :folower

# ーーー自分がフォローされるユーザーとの関連ーーーーーーーーーーーーーー
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :followings

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

end
