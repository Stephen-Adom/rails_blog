class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_posts_counter

  def recent_comments
    comments.order(created_at: :desc).first(5)
  end

  def comments_length
    comments.length
  end

  def likes_length
    likes.length
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
