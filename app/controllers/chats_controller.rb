class ChatsController < ApplicationController
    def index
        @chats = Chat.all
        if @chats
          render json: {
            chats: @chats
          }
        else
          render json: {
            status: 500,
            errors: ['no chats found']
          }
        end
    end
    def show
        @chat = Chat.find(params[:id])
       if @chat
          render json: {
            chat: @chat
          }
        else
          render json: {
            status: 500,
            errors: ['chat not found']
          }
        end
      end

      def new
        @chat = Chat.new
      end
      
      def create
        @task = Task.find_by_id(params[:task_id])
        @chat = Chat.new(chat_params)
        @chat.user_id = session[:user_id]
        if @chat.save
          render json: {
            status: :created,
            chat: @chat
          }
        else 
          render json: {
            status: 500,
            errors: @chat.errors.full_messages
          }
        end
      end
      
    private

      def chat_params
        params.require(:chat).permit(:message, task_ids: [])
      end
    end
