class ClientsController < ApplicationController

  def index
   @clients = Client.all.order(:name)
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
    @workout = @client.workouts.order(:date).reverse
    @goal = @client.goals
    @food_log = @client.food_logs.order(:date).reverse
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
      params.require(:client).permit(:name, :phone, :email, :member_id,
      :emergency_contact, :emergency_number, :additional_info, :client_id,
      :password)
    end
  end
