class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :authentication_keys => [:username]
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_one :character
  enum color_claws: [:gray, :black, :white, :gold, :sand, :silver]
  enum kind: [:wizard, :sorcerer, :warrior, :knight, :hunter, 
              :assassin, :priest, :healer]
  
  def will_save_change_to_email?
    false
  end
end
