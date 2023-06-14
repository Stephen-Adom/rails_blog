class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :update_posts_counter, -> { User.find(3).update(posts_counter: User.find(3).posts.count) }

  def recent_comments
    comments.order(created_at: :desc).first(5)
  end

  def comments_length
    comments.length
  end

  def likes_length
    likes.length
  end
end
