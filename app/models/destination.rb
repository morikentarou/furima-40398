class Destination < ApplicationRecord
  belongs_to :purchase

  validates :post_code, presence: true
  validates :area_id, presence: true
  validates :municipality, presence: true
  validates :street, presence: true
  validates :tel, presence: true
end
