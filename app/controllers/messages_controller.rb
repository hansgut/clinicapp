class MessagesController < ApplicationController
  before_action :set_last_seen, if: proc { user_signed_in? or doctor_signed_in? }
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = @chatroom.messages.create(message_params)
    if user_signed_in? then client = 0 else client = 1 end
    if @message.sender == 0 then avatar = @message.user.avatar.url(:medium) else avatar = @message.doctor.avatar.url(:medium) end
    if @message.sender == 0 then sender_name = @message.user.full_name else sender_name = @message.doctor.full_name end
    @message.errors.each {|e| puts e}
    if @message.save
      ActionCable.server.broadcast 'chatroom_channel', content: @message.body,
                                                           sender: @message.sender,
                                                           chatroom: @chatroom.id,
                                                           avatar_url: avatar,
                                                           client: client,
                                                           time: @message.created_at,
                                                           sender_name: sender_name
    end

    respond_to do |format|
      format.js
    end
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :doctor_id, :sender, :body)
  end

  def set_last_seen
    if user_signed_in?
      current_user.update_attribute(:last_seen, Time.current)
    else
      current_doctor.update_attribute(:last_seen, Time.current)
    end
  end
end
