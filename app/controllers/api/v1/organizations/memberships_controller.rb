module Api
  module V1
    module Organizations
      class MembershipsController < ApplicationController
        before_action :set_organization

        HARDCODED_USER_ID = 1

        def create
          user = User.find(HARDCODED_USER_ID)
          membership = @organization.memberships.new(user: user)

          if membership.save
            render json: { message: "Joined organization successfully" }, status: :created
          else
            render json: { errors: membership.errors.full_messages }, status: :unprocessable_content
          end
        end

        def destroy
          user = User.find(HARDCODED_USER_ID)
          membership = @organization.memberships.find_by(user: user)

          if membership&.destroy
            render json: { message: "Left organization successfully" }, status: :ok
          else
            render json: { errors: ["Membership not found or could not be destroyed"] }, status: :not_found
          end
        end

        private
        def set_organization
          @organization = Organization.find_by!(uuid: params[:organization_uuid])
        end
      end

    end
  end
end