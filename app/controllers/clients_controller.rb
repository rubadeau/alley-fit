class ClientsController < ApplicationController

  def index
   @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to client_path(@client), notice: 'Client created successfully!'
    else
      render :new
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      flash[:notice] = "Client updated successfully!"
      redirect_to client_path(@client)
    else
      render :edit
    end
  end

  def destroy
   client = Client.find(params[:id])
   client.destroy
   flash[:notice] = "Deleted Client"
   redirect_to clients_path
  end


    private

    def client_params
      params.require(:client).permit(:name)
    end
  end
