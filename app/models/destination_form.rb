class DestinationForm 
  include ActiveModel::Model
    attr_accessor :post_code, :area_id, :municipality, :street, :building, :tel, :user_id, :item_id
    
    validates :post_code, presence: true
    validates :area_id, presence: true
    validates :municipality, presence: true
    validates :street, presence: true
    validates :tel, presence: true

  def save
    return false unless valid?
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, area_id: area_id, municipality: municipality, street: street, building: building, tel: tel, purchase_id: purchase.id).persisted?
  end
end
