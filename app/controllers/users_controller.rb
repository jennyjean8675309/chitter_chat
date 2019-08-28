class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end
    
    def create
        user = User.create(username: params['user']['username'], password: params['user']['password'])
        payload = {'user_id': user.id}
        token = encode(payload)
        avatar_url = rails_blob_path(user.avatar) if user.avatar.attached?
        render json: {
            user: user,
            avatar_url: avatar_url,
            token: token,
            authenticated: true
        }
    end

    def show
        token = request.headers['Authentication'].split(' ')[1]
        payload = decode(token)
        user = User.find(payload['user_id'])
        avatar_url = rails_blob_path(user.avatar) if user.avatar.attached?
        if user
            render json: {user: user, avatar_url: avatar_url, status: :accepted}
        else 
            render json: { message: 'Error', authenticated: false }
        end
    end

    def update
        user = User.find(params[:id])
        user.update(avatar: params[:avatar])
        avatar_url = rails_blob_path(user.avatar) if user.avatar.attached?
        render json: {user: user, avatar_url: avatar_url}
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :avatar)
    end
end
