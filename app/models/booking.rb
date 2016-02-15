class Booking < ActiveRecord::Base
  belongs_to :kitten
  belongs_to :renter, class_name: :User, foreign_key: "user_id"

  validates :start_date, :end_date, :kitten_id, presence: true
end
