class Property < ApplicationRecord
  validates :property_name,presence:true
  validates :rent,presence:true
  validates :address, presence:true
  validates :age, presence:true
  has_many :stations,dependent: :destroy
  accepts_nested_attributes_for :stations, reject_if: :reject_blank, allow_destroy: true

  def reject_blank(attributed)
    attributed['station_name'].blank? || attributed['line'].blank? || attributed['minutes_walk'].blank?
  end
end
