class AuthController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            payload = {'user_id': user.id}
            token = encode(payload)
            render json: {
                user: UserSerializer.new(user),
                token: token,
                authenticated: true,
                user_rooms: RoomSerializer.new(user.rooms)
            }
        else 
            render json: {
                message: 'This username/password combination cannot be found',
                authenticated: false
            }
        end
    end
end