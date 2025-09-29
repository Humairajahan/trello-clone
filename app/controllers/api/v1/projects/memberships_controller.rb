module Api
  module V1
    module Projects
      class MembershipsController < ApplicationController
        before_action :set_project_and_user

        def create
          project_membership = @project.project_memberships.new(user: @user, role: params[:role])

          if project_membership.save
            render json: project_membership, status: :created
          else
            render json: { errors: project_membership.errors.full_messages }, status: :unprocessable_content
          end
        end

        def destroy
          project_membership = @project.project_memberships.find_by!(user: @user)

          if project_membership&.destroy
            render json: { message: "Successfully removed member from project" }, status: :ok
          else
            render json: { errors: project_membership.errors.full_messages }, status: :unprocessable_content
          end
        end

        private
        def project_membership_params
          params.permit(:project_uuid, :user_uuid, :role)
        end

        def set_project_and_user
          @project = Project.find_by!(uuid: params[:project_uuid])
          @user = User.find_by!(uuid: params[:user_uuid])
        end
      end
    end
  end
end
