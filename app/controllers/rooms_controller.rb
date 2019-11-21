class RoomsController < ApplicationController
    def index
        rooms = Room.all
        render json: RoomSerializer.new(rooms)
    end

    def show
        room = Room.find(params[:id])
        render json: RoomSerializer.new(room)
    end
end