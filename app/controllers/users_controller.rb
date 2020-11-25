class UsersController < ApplicationController
    def signup
        @user = User.create(user_params)
        if @user.save
            render json: {message: 'SUCCESS', data: @user}, status: :ok
        else
            render json: {message: 'ERROR', data: @user.errors}, status: unprocessable_entity
        end
    end
    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            render json: {message: 'SUCCESS', data: @user}, status: :ok
        else
            render json: {message: 'ERROR', data: @user.errors}, status: :ok
        end
    end
    private
    def user_params
        params.permit(:username, :password)
    end
end