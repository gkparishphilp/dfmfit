class WaiversController < ApplicationController


  def new
    @waiver = Waiver.new
  end


  def create
    @waiver = Waiver.new(waiver_params)
    @user = User.find_or_create_by( email: params[:waiver][:email] )
    @waiver.user = @user

    if @waiver.save
      #flash[:success] = "Your waiver was successfully signed."
      redirect_to thank_you_waivers_path
      WaiverMailer.waiver_notification(@waiver).deliver
    else
      render 'new'
    end

  end


  private

  def waiver_params
    params.require(:waiver).permit(:name, :dob, :street, :city, :state, :zip, :phone, :email, :emergency_contact_name, :emergency_contact_phone,
                                    :heart_condition, :chest_pain_doing_activity, :chest_pain_without_doing_activity,
                                    :lose_balance, :bone_problem, :prescription_drugs, :other_reason_not_to_do_activity,
                                    :signature, :sign_date, :legal_guardian_name, :legal_guardian_signature, :legal_guardian_sign_date, :status )
  end

end
