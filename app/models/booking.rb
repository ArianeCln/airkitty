class Booking < ActiveRecord::Base
  belongs_to :kitten
  belongs_to :user, class_name: "Renter", foreign_key: "user_id"

  validates :start_date, :end_date, :kitten_id, presence: true
end
