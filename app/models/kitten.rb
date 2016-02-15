class Kitten < ActiveRecord::Base
  RACES = ["Le Persan", "Le Maine coon", "Le Sacré de Birmanie", "Le Chartreux", "Le Norvégien", "Le Bristish shorthair", "Le Bengal", "Le Ragdol L’Exotic shorthair", "Le Siamois"]
  belongs_to :user, dependent: :destroy, class_name: "Owner", foreign_key: "user_id"
  has_many :bookings

  validates :name, presence: true
  validates :race, inclusion: { in: RACES}
end
