class Course < ActiveRecord::Base
  has_many :registrations
  has_many :users, :through => :registrations
  has_many :lessons
  validates_presence_of :name, :price, :message => "can't be blank"
  attr_accessible :name, :price
  MERCHANT_ID = 368578617175864
  MERCHANT_KEY = 'zKSnCdZXULVoRQ6Vf77JwQ'

  def to_google_product
    hash = {}
    hash[:name] = self.name
    hash[:description] = self.name
    hash[:price] = self.price
    hash[:quantity] = 1
    hash[:currency] = 'USD'
    hash[:regular_shipping] = 0
    hash
  end
end


# This is the secod comment
