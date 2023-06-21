class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def user_recent_posts
    posts.order(created_at: :desc).first(3)
  end

  def user_has_liked(post_id)
    likes.exists?(post_id:)
  end

  def remove_user_like(post_id)
    likes.find_by(post_id:).destroy
  end

  def add_user_like(post_id)
    likes.create(post_id:)
  end
end
