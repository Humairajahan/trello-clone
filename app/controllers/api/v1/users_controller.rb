module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: users
      end

      def show
        user = User.find_by!(uuid: params[:uuid])
        render json: user, status: :ok
      end

      def destroy
        User.find_by!(uuid: params[:uuid]).destroy!
        head :no_content
      end
    end
  end
end
