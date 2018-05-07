class ChatroomsController < ApplicationController
  def index
    if user_signed_in?
      @all_docs = Doctor.all
    else
      @all_users = User.all
    end
  end
end
