class Information < ApplicationRecord
  belongs_to :group
  geocoded_by :camp_site_address
  after_validation :geocode
end
