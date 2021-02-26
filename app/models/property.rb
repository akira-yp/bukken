class Property < ApplicationRecord
  validates :property_name,presence:true
  validates :rent, presence:true
  validates :address, presence:true
  validates :age, presence:true
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, allow_destroy: true, reject_if: :reject_blank

  def reject_blank(attributed)
    if attributed[:id]
      attributed.merge!( _destroy: 1 ) && false if attributed['line'].blank? && attributed['station_name'].blank? && attributed['minutes_walk'].blank?
    else
      attributed['station_name'].blank? || attributed['line'].blank? || attributed['minutes_walk'].blank?
    end
  end
end
