class Post < ApplicationRecord
  has_and_belongs_to_many :users,:join_table => :posts_users_read_status
  belongs_to :topic
  belongs_to :user
  has_many :comments , dependent: :destroy
  has_many :ratings  , dependent: :destroy
  has_many :taggings , dependent: :destroy
  has_many :tags , through: :taggings
  accepts_nested_attributes_for :tags,reject_if: :reject_posts
  has_one_attached :post_image
  def reject_posts(attributes)
    attributes['tag'].blank?
  end
  # reject_if: proc { |attributes| attributes['tag'].blank? }, allow_destroy: true
end
