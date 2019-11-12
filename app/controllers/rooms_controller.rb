class RoomsController < ApplicationController
    def index
        rooms = Room.all
        render json: rooms
    end

    def create
        room = Room.new(room_params)
        if room.save
            ActionCable.server.broadcast "rooms_channel", room
            head :ok
        end
    end

    def show
        room = Room.find(params[:id])
        users = room.users
        messages = room.messages
        render json: {room: room, users: users, messages: room.messages}
    end

    private

    def room_params
        params.require(:room).permit(:name, :description)
    end
end