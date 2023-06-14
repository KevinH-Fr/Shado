# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @sports = Sport.all

    super do |resource|
      if params[:role] == "fan"
        resource.build_fan
      elsif  params[:role] == "athlete"

              

        
        
      end 
    end

  end


  def after_sign_up_path_for(resource)
    # Customize the logic to determine the redirect path based on your requirements
  
      steps_athlete_step2_path()
   
  end

  
  # POST /resource
  # def create
    # super

    # puts "----------- redirect apres create athlete"
    # redirect_to new_campaign_path and return
   #end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, 
      fan_attributes: [:pseudo, :profile_pic], 
      athlete_attributes: [:name, :profile_pic, :sport_id])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, 
      fan_attributes: [:pseudo, :profile_pic], 
      athlete_attributes: [:name, :profile_pic, :sport_id])
  end

end
