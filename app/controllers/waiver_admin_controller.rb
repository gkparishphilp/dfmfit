class WaiverAdminController < ApplicationAdminController

  def index
    @waivers = Waiver.all
  end

  def show
    @waiver = Waiver.find(params[:id])
  end

end
