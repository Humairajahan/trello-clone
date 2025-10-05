module Api
  module V1
    module Projects
      class BoardsController < ApplicationController
        before_action :set_project

        def index
          boards = @project.boards
          render json: boards, status: :ok
        end

        private
        def set_project
          @project = Project.find_by(uuid: params[:project_uuid])
        end
      end
    end
  end
end