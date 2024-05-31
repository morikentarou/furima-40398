class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase

  validates :image,         presence: true
  validates :name,          presence: true
  validates :description,   presence: true
  validates :category_id,   presence: true
  validates :condition_id,  presence: true
  validates :delivery_id,   presence: true
  validates :area_id,       presence: true
  validates :time_id,       presence: true
  validates :price,         presence: true
end
