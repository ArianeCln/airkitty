class Review < ActiveRecord::Base
  belongs_to :kitten
  validates :content, presence: true
  validates :kitten_id, presence: true
  validates :rating, numericality: true, inclusion: { in: [0,1,2,3,4,5] }
end
