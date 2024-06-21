class DestinationForm
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipality, :street, :building, :tel, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :street
    validates :tel, length: { in: 10..11 },
                    format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width numbers.' }
    validates :token
  end

  def save
    return false unless valid?

    purchase = Purchase.create(user_id:, item_id:)
    Destination.create(post_code:, area_id:, municipality:, street:, building:,
                       tel:, purchase_id: purchase.id).persisted?
  end
end
