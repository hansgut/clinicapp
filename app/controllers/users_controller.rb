class UsersController < ApplicationController
  before_action :set_last_seen, if: proc { user_signed_in? or doctor_signed_in? }
  
  def show
    @user = User.find(params[:id])
  end

  private
  def set_last_seen
    if user_signed_in?
      current_user.update_attribute(:last_seen, Time.current)
    else
      current_doctor.update_attribute(:last_seen, Time.current)
    end
  end
end
