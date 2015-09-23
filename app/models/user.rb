class User < ActiveRecord::Base
  belongs_to :clue
  has_many :game_users
  has_many :games, through: :game_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
