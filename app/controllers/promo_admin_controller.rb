class PromoAdminController < ApplicationAdminController

  def index
    @promos = Promo.all
  end

 def show
 end

  def new
    @promo = Promo.new
  end
  
  def edit
    @promo = Promo.find(params[:id])
  end

  def create
    @promo = Promo.new(promo_params)

    @user = User.find_or_create_by( email: params[:email] )
    @promo.user = @user

    if @promo.save
      flash[:success] = "New promotion was successfully uploaded."
      redirect_to promo_admin_path
    else
      render 'new'
    end
  end

  def update
    @promo = Promo.find(params[:id])
    if @promo.update(promo_params)
      flash[:success] = "Promotion was successfully updated."
      redirect_to @promo
    else
      render 'edit'
    end
  end

  def destroy
    @promo = Promo.find(params[:id])
    @promo.destroy
    flash[:primary] = "Promotion was successfully deleted."
    redirect_to promos_admin_index_path
  end

private

def promo_params
  params.require(:promo).permit(:promo_title, :promo_text )
end

end
