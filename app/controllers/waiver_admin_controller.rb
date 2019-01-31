class WaiverAdminController < ApplicationAdminController

  def index
    @waivers = Waiver.paginate(:page => params[:page], :per_page => 15)

  end

  def show
    @waiver = Waiver.find(params[:id])
  end

end
