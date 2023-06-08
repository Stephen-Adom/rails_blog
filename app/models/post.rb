class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :update_posts_counter, -> { User.find(3).update(posts_counter: User.find(3).posts.count) }
  scope :recent_comments, -> { Comment.where(post_id: 2).order(created_at: :desc).first(5) }
end
