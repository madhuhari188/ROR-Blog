class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_and_belongs_to_many :posts, :join_table => :posts_users_read_status
  has_one :post
  has_one :comment
  devise :database_authenticatable, :registerable,:lockable,
         :recoverable, :rememberable, :validatable,:trackable,
         :timeoutable, timeout_in: 5.minutes

end
