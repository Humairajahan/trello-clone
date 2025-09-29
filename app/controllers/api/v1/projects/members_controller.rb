module Api
  module V1
    module Projects
      class MembersController < ApplicationController
        before_action :set_project

        def index
          members = @project.users
          render json: members, status: :ok
        end

        private
        def set_project
          @project = Project.find_by!(uuid: params[:project_uuid])
        end
      end
    end
  end
end
