class RoomsChannel < ApplicationCable::Channel
  # when a user is 'subscribed' it means that they have loaded the relevant page, are viewing it
  def subscribed
    # stream_from "some_channel"
    @room = Room.find_by(id: params[:room])
    stream_for @room
  end

  def received(data)
    RoomsChannel.broadcast_to(@room, {room: @room, users: @room.users, messages: @room.messages})
  end

  def unsubscribed
    # any cleanup needed when channel is unsubscribed
    # do I need to unsubscribe a user when they log out???
  end
end
