class ClientsController < ApplicationController
    
    before_filter :authenticate_user!

    load_and_authorize_resource
    #load_and_authorize_all - for custom actions
    
    def index
        @clients = current_user.clients
    end

    def new
        @client = Client.new
    end

    def show
        @client = current_user.clients.find(params[:id])
    end

    def create
        @client = Client.new(client_params)
        @client.user_id = current_user.id
        if @client.save
            redirect_to clients_path, notice: "Cool..Client Successfully Registered ! :)"
        else
            render action: "new"
        end
    end

    private
    #To restrict Mass Assignment
    def client_params
        params[:client].permit(:name, :company, :email, :mobile)
    end

end
