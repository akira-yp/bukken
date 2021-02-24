class Property < ApplicationRecord
  validates :property_name,presence:true
  validates :rent,presence:true
  validates :address, presence:true
  validates :age, presence:true
  has_many :stations,dependent: :destroy
  accepts_nested_attributes_for :stations, allow_destroy: true
end
