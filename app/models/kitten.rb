class Kitten < ActiveRecord::Base
  # RACES = ["Le Persan", "Le Maine coon", "Le Sacré de Birmanie", "Le Chartreux", "Le Norvégien", "Le Bristish shorthair", "Le Bengal", "Le Ragdol L’Exotic shorthair", "Le Siamois"]
  RACES = %w(Persan Bengal Abyssin Ragdol Burmese Balinese Chartreux Cymric Javanese Korat)
  PERSONA = ["aggressive", "nice", "calm", "frisky", "wild", "lazy", "sweet", "polite", "energetic", "phlegmatic"]
  belongs_to :owner, class_name: :User, foreign_key: "user_id"
  has_many :bookings, dependent: :destroy
  has_many :renters, through: :bookings
  has_many :reviews, dependent: :destroy
  has_attachments :photos, maximum: 3

  validates :name, presence: true
  validates :race, inclusion: { in: RACES}
  # validates :user, presence: true

  # make sure there is no conflict between those two lines
  # validates :owner, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  scope :race, -> (race) { where race: race }
  scope :personality, -> (personality) { where personality: personality }

  def self.search(search)
    where("kittens.address ILIKE ?", "%#{search}%")
  end

  def calc_average_rating
    self.reviews
    sum = 0
    self.reviews.each do |review|
      sum += review.rating
    end
    average = sum.fdiv(self.reviews.count).round
  end
end
