module Api
  module V1
    class OrganizationsController < ApplicationController
      def index
        orgs = Organization.all
        render json: orgs, status: :ok
      end

      def create
        org = Organization.new(org_params)

        if org.save
          render json: org, status: :created
        else
          render json: { errors: org.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        org = Organization.find_by!(uuid: params[:uuid])
        render json: org, status: :ok
      end

      def destroy
        Organization.find_by!(uuid: params[:uuid]).destroy!
        head :no_content
      end


      private
      def org_params
        params.permit(:name)
      end
    end
  end
end
