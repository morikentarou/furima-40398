class Destination < ApplicationRecord
  belongs_to :purchase

  validates :post_code, presence: true,
                        format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality, presence: true
  validates :street, presence: true
  validates :tel, presence: true,
                  length: { in: 10..11 },
                  format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width numbers.' }
end
