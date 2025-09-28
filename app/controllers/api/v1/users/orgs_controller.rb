module Api
  module V1
    module Users
      class OrgsController < ApplicationController
        before_action :set_user

        def index
          orgs = @user.organizations
          render json: orgs, status: :ok
        end

        private
        def set_user
          @user = User.find_by!(uuid: params[:user_uuid])
        end
      end
    end
  end
end
