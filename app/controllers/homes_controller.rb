class HomesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to user_path(current_user)
    end

    if doctor_signed_in?
      redirect_to doctor_path(current_doctor)
    end
  end
end
