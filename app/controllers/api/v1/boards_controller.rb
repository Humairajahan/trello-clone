module Api
  module V1
    class BoardsController < ApplicationController
      before_action :set_project, only: [ :index, :create ]

      def index
        boards = Board.all
        render json: boards
      end

      def create
        board = Board.new(name: params[:name], project: @project)

        if board.save
          render json: board, status: :created
        else
          render json: { errors: board.errors.full_messages }, status: :unprocessable_content
        end
      end

      def show
        board = Board.find_by(uuid: params[:uuid])
        render json: board, status: :ok
      end

      def destroy
        Board.find_by!(uuid: params[:uuid]).destroy!
        head :no_content
      end

      private
      def set_project
        @project = Project.find_by(uuid: params[:project_uuid])
      end

      def board_params
        params.permit(:name, :project_uuid)
      end
    end
  end
end
