class FriendRequestsController < ApplicationController

    def create
        friend_request = FriendRequest.create(friend_request_params)
        if friend_request.valid?
            render json: friend_request, status: :created
        else
            render json: {errors: friend_request.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: params[:id]) #should use session id
        if user
            requests = user.friend_requests
            if requests
                render json: requests, status: :ok
            else
                head :no_content
            end
        else
            render json: {error: "User not found"}, status: :not_found
        end
    end

    def cancel_request
        request = FriendRequest.find_by(requester_id: params[:requester], requestee_id: params[:requestee])
        request.destroy
        head :no_content
    end

    def destroy
        friend_request = FriendRequest.find_by(id: params[:id])
        friend_request.destroy
        head :no_content
    end

    private

    def friend_request_params
        params.permit(:requester_id, :requestee_id)
    end
end
