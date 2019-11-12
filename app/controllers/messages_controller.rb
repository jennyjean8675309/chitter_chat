class MessagesController < ApplicationController
    def create
        message = Message.new(message_params)
        @room = Room.find(message_params["room_id"])
        if message.save
            RoomsChannel.broadcast_to(@room, {
                room: @room,
                users: @room.users,
                messages: @room.messages
            })
        end
        render json: message
    end

    private

    def message_params
        params.require(:message).permit(:title, :content, :user_id, :room_id)
    end
end