class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :authentication_keys => [:username]
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_one :character
  
  def will_save_change_to_email?
    false
  end
end
