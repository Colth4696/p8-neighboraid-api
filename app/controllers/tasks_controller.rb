class TasksController < ApplicationController

        def index
            @tasks = Task.all
            if @tasks
              render json: {
                tasks: @tasks
              }
            else
              render json: {
                status: 500,
                errors: ['no tasks found']
              }
            end
        end
        def show
            @task = Task.find(params[:id])
           if @task
              render json: {
                task: @task
              }
            else
              render json: {
                status: 500,
                errors: ['task not found']
              }
            end
          end
          
          def create
            @task = Task.new(task_params)
            @task.user_id = session[:user_id]
            if @task.save
              render json: {
                status: :created,
                task: @task
              }
            else 
              render json: {
                status: 500,
                errors: @task.errors.full_messages
              }
            end
          end
          
        private
          
          def task_params
            params.require(:task).permit(:title, :description, :latitude, :longitude, :task_type)
          end
        end
