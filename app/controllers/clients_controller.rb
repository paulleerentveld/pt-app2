class ClientsController < ApplicationController
    before_action :require_logged_in
    #skip_before_action :require_logged_in, only: [:index]

    def index
        @clients = Client.all
    end

    def show
        @client = Client.find(params[:id])
    end

    def new
        @client = Client.new
    end

    def edit
        @client = Client.find(params[:id])
    end

    def create
        @client = Client.new(client_params)
        if @client.save
            redirect_to @client
          else
            render "new"
        end
    end

    def update
        @client = Client.find(params[:id])
        if @client.update(client_params)
            redirect_to client_url(@client), notice: "Client was successfully updated."
          else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @client = Client.find(params[:id])
        @client.destroy
        redirect_to clients_url, notice: "Client was successfully destroyed."
    end

    def assign
        @client = Client.find(params[:id])
        @workouts = Workout.all

    end
    

    private

    def client_params
      params.require(:client).permit(:firstname, :lastname, :email, :mobile, :sex, :weight, :height, :dob, :instructor_id)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
