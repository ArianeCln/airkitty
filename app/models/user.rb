class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :kittens, dependent: :destroy
  has_many :renters, through: :kittens
  has_many :bookings
  has_many :owners, through: :bookings

  validates :name, :address, presence: true
  # validates :email, uniqueness: true
end
