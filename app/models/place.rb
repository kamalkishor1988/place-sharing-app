class Place < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :address, :user
  validates_inclusion_of :public, in: [true, false]
  geocoded_by :address, latitude: :latitude, longitude: :longitude
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
