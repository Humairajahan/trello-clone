module Api
  module V1
    class ProjectsController < ApplicationController
      # Will be passed via header/cookies
      HARDCODED_ORG_ID = 2
      def index
        projects = Project.all
        render json: projects, status: :ok
      end

      def create
        organization = Organization.find(HARDCODED_ORG_ID)
        project = organization.projects.new(project_params)

        if project.save
          render json: project, status: :created
        else
          render json: { errors: project.errors.full_messages }, status: :unprocessable_content
        end
      end

      def show
        project = Project.find_by!(uuid: params[:uuid])
        render json: project, status: :ok
      end

      def destroy
        Project.find_by!(uuid: params[:uuid]).destroy!
        head :no_content
      end

      private
      def project_params
        params.permit(:name, :description, :start_date, :end_date)
      end
    end
  end
end
