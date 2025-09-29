module Api
  module V1
    module Organizations
      class ProjectsController < ApplicationController
        before_action :set_organization

        def index
          projects = @organization.projects
          render json: projects, status: :ok
        end

        private
        def set_organization
          @organization = Organization.find_by!(uuid: params[:organization_uuid])
        end
      end
    end
  end
end
