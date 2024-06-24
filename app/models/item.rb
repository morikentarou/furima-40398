class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :area
  belongs_to :scheduled_delivery
  has_one_attached :image

  belongs_to :user
  has_one :purchase
  def sold_out?
    !purchase.nil?
  end

  validates :image,                 presence: true
  validates :name,                  presence: true, length: { maximum: 40 }
  validates :description,           presence: true, length: { maximum: 1000 }
  validates :category_id,           presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,          presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_id,           presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,               presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,                 presence: true,
                                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
