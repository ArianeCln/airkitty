class Kitten < ActiveRecord::Base
  # RACES = ["Le Persan", "Le Maine coon", "Le Sacré de Birmanie", "Le Chartreux", "Le Norvégien", "Le Bristish shorthair", "Le Bengal", "Le Ragdol L’Exotic shorthair", "Le Siamois"]
  RACES = %w(A B C D E F G H I J)
  belongs_to :owner, class_name: :User, foreign_key: "user_id"
  has_many :bookings, dependent: :destroy
  has_many :renters, through: :bookings

  validates :name, presence: true
  validates :race, inclusion: { in: RACES}

  # make sure there is no conflict between those two lines
  # validates :owner, presence: true

  def self.search(search)
    where("users.address ILIKE ?", "%#{search}%")
  end
end
