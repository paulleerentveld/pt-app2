class ClientsController < ApplicationController

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
        if @client.update(client_params)
            redirect_to client_url(@client), notice: "Client was successfully updated."
          else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @client.destroy
        redirect_to clients_url, notice: "Client was successfully destroyed."
    end
    

    private

    def client_params
      params.require(:client).permit(:firstname, :lastname, :email, :mobile, :sex, :weight, :height, :dob, :instructor_id)
    end

end
