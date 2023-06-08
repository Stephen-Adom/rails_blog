class User < ApplicationRecord
  has_many :likes, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :posts, foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :user_recent_posts, -> { find(2).posts.order(created_at: :desc).first(3) }
end
