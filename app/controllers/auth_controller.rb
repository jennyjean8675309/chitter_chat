class AuthController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            payload = {'user_id': @user.id}
            token = encode(payload)
            avatar_url = rails_blob_path(@user.avatar) if @user.avatar.attached?
            render json: {
                user: @user,
                avatar_url: avatar_url,
                token: token,
                authenticated: true,
                user_rooms: @user.rooms
            }
        else 
            render json: {
                message: 'This username/password combination does not exist',
                authenticated: false
            }
        end
    end
end