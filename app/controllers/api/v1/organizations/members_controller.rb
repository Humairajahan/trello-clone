module Api
  module V1
    module Organizations
      class MembersController < ApplicationController
        before_action :set_organization

        def index
          members = @organization.users
          render json: members, status: :ok
        end

        private
        def set_organization
          @organization = Organization.find_by!(uuid: params[:organization_uuid])
        end
      end
    end
  end
end
