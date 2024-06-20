class DestinationForm 
  include ActiveModel::Model
    attr_accessor :post_code, :area_id, :municipality, :street, :building, :tel, :user_id, :item_id, :token, :price
    
    validates :post_code, presence: true,  format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality, presence: true
    validates :street, presence: true
    validates :tel, presence: true,
                    length: { in: 10..11 },
                    format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width numbers." }
    validates :token, presence: true

  def save
    return false unless valid?
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, area_id: area_id, municipality: municipality, street: street, building: building, tel: tel, purchase_id: purchase.id).persisted?
  end
end
