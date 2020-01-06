class RoomsChannel < ApplicationCable::Channel
  # when a user is 'subscribed' it means that they have loaded the relevant page, are viewing it
  # this action runs once upon initialization (and it doesn't require the frontend server to be running, then runs again every time the roomChannel updates - it's called from the RoomWebSocket component)
  def subscribed
    # stream_from "some_channel"
    # my subscriptions are being created on the RoomWebSocket component from the frontend
    @room = Room.find_by(id: params[:room])
    stream_for @room
  end

  # the second argument to broadcast_to matches the information that I am getting from the frontend
  def received(data)
    RoomsChannel.broadcast_to(@room, {room: @room, users: @room.users, messages: @room.messages})
  end

  def unsubscribed
    # any cleanup needed when channel is unsubscribed
    # do I need to unsubscribe a user when they log out???
  end
end
