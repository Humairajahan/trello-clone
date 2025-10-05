module Api
  module V1
    class AuthController < ApplicationController
      def signup
        user = User.find_by(email: params[:email])
        if user
          render json: { errors: "User with this email already exists" }, status: :unprocessable_content
          return
        end

        user = User.new(user_params)
        if user.save
          tokens = JwtService.generate_tokens(user)
          render json: tokens, status: :created
        else
          render json: { error: user.errors.full_messages }, status: :unprocessable_content
        end
      end

      def signin
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          tokens = JwtService.generate_tokens(user)
          render json: tokens, status: :ok
        else
          render json: { error: "Invalid credentials" }, status: :unauthorized
        end
      end

      def signout
      end
      def generate_verification_code
      end
      def verify_account
      end
      def forgot_password
      end
      def reset_password
      end

      private
      def user_params
        params.permit(:name, :email, :role, :password, :password_confirmation)
      end
    end
  end
end
