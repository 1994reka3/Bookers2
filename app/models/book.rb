class Book < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


  def Book.search(search, user_or_book, search_how)
    if user_or_book == "2"
      if search_how == "match"
        Book.where(['title LIKE ?', "#{search}"])
      elsif search_how == "forward"
        Book.where(['title LIKE ?', "#{search}%"])
      elsif search_how == "backword"
        Book.where(['title LIKE ?', "%#{search}"])
      elsif search_how == "partical"
        Book.where(['title LIKE ?', "%#{search}%"])
      else
        Book.all
      end
    end
  end
end
