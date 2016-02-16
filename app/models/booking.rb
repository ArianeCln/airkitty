class Booking < ActiveRecord::Base
  belongs_to :kitten
  has_one :owner, through: :kitten
  belongs_to :renter, class_name: :User, foreign_key: "user_id"

  validates :start_date, :end_date, :kitten_id, presence: true
  validates :renter, presence: true
end
