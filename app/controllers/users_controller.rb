class UsersController < ApplicationController

    def index
        users = User.all
        render json: users, status: :created
    end

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user, serializer: UserDetailsSerializer, status: :created
        else
            render json: {error: "User not Found"}, status: :not_found
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        head :no_content
    end

    private

    def user_params
        params.permit(:username, :email, :first_name, :last_name, :password)
    end
    
end
