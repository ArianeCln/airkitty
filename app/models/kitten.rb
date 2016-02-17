class Kitten < ActiveRecord::Base
  # RACES = ["Le Persan", "Le Maine coon", "Le Sacré de Birmanie", "Le Chartreux", "Le Norvégien", "Le Bristish shorthair", "Le Bengal", "Le Ragdol L’Exotic shorthair", "Le Siamois"]
  RACES = %w(A B C D E F G H I J)
  PERSONA = ["aggressif", "gentil", "calme", "fougeux", "sauvage", "flemmard", "tendre", "respectueux", "énergique", "flegmatique"]
  belongs_to :owner, class_name: :User, foreign_key: "user_id"
  has_many :bookings, dependent: :destroy
  has_many :renters, through: :bookings
  has_attachments :photos, maximum: 3

  validates :name, presence: true
  validates :race, inclusion: { in: RACES}
  # validates :user, presence: true

  # make sure there is no conflict between those two lines
  # validates :owner, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(search)
    where("users.address ILIKE ?", "%#{search}%")
  end
end
