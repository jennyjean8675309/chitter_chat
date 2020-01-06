class RoomsChannel < ApplicationCable::Channel
  # when a user is 'subscribed' it means that they have loaded the relevant page and are viewing it

  def subscribed
    # stream_from "some_channel"
    # my subscriptions are being created on the RoomWebSocket component from the frontend
    @room = Room.find_by(id: params[:room])
    stream_for @room
  end

  # the second argument to broadcast_to matches the information that I am getting from the frontend, and passing from the MessagesController create action
  # def received(data)
  #   RoomsChannel.broadcast_to(@room, {room: @room, users: @room.users, messages: @room.messages})
  # end

  def unsubscribed
    # any cleanup needed when channel is unsubscribed
  end
end
