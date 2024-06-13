class OrderPaymentForm
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipality, :street, :tel
  validates :post_code, presence: true
  validates :area_id, presence: true
  validates :municipality, presence: true
  validates :street, presence: true
  validates :tel, presence: true
  
  def save
    return false unless valid?

    Destination.create(post_code: post_code, area_id: area_id, municipality: municipality, street: street, tel: tel)
    if destination.save
      true
    else 
      false
    end
  end
end