class WaiverAdminController < ApplicationAdminController

    def index
      @waivers = Waiver.page( params[:page] )
    end

    def show
      @waiver = Waiver.find(params[:id])
    end

end
