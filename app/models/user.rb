class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :kittens
  has_many :bookings

  validates :name, :password, :address, presence: true
  validates :email, presence: true, uniqueness: true
end
