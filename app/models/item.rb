class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :area
  belongs_to :scheduled_delivery 

  belongs_to :user
  # has_one :purchase

  validates :image,                 presence: true
  validates :name,                  presence: true
  validates :description,           presence: true
  validates :category_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,          presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id,               presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                 presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
