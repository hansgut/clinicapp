class ChatroomsController < ApplicationController
  before_action :set_last_seen, if: proc { user_signed_in? or doctor_signed_in? }
  def index
    if user_signed_in?
      @chatrooms = Chatroom.where({ user_id: current_user.id })
      docs_ids = []
      @chatrooms.each {|c| docs_ids << c.doctor_id}
      unless docs_ids.empty?
        @all_docs = Doctor.where('id NOT IN (?)',docs_ids)
      else
        @all_docs = Doctor.all
      end
    end

    if doctor_signed_in?
      @chatrooms = Chatroom.where({ doctor_id: current_doctor.id })
      users_ids = []
      @chatrooms.each {|c| users_ids << c.user_id}
      unless users_ids.empty?
        @all_users = User.where('id NOT IN (?)',users_ids)
      else
        @all_users = User.all
      end

    end
  end

  def create
    @chatroom = Chatroom.new(:user_id => params[:user_id], :doctor_id => params[:doctor_id])

    respond_to do |format|
      if @chatroom.save
        format.html { redirect_to chatrooms_path, notice: 'Like was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chatroom }
      else
        format.html { render action: 'index' }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = Message.where({chatroom_id: @chatroom.id})
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
