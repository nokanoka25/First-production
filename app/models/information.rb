class Information < ApplicationRecord
  belongs_to :group
  geocoded_by :camp_site_address
  after_validation :geocode

  def start_time
    start_day # simple_calendar 用に start_day を返す
  end
  def finish_time
    finish_day # `simple_calendar` に `end_time:` はないが、ここで `finish_day` を扱えるようにする
  end
end
