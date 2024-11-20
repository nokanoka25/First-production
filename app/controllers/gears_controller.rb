class GearsController < ApplicationController
  def index
    @gears = Gear.all
  end
  def edit; end

end
