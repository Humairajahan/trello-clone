module Api
  module V1
    class UsersController < ApplicationController
      def index
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_content
        end
      end

      private
      def user_params
        params.permit(:name, :email, :role, :password, :password_confirmation)
      end
    end
  end
end