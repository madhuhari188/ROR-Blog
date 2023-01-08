class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_and_belongs_to_many :posts, :join_table => :posts_users_read_status
  has_one :post
  has_one :comment
  devise :database_authenticatable, :registerable, :lockable, :omniauthable,
         :recoverable, :rememberable, :validatable,:trackable,
         :timeoutable, timeout_in: 5.minutes


  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create  do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

end
