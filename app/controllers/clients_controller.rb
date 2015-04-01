class ClientsController < ApplicationController

  before_action :set_client

  def index
   @clients = Client.all.order(:name)
  end

  def new
    @client = Client.new
  end

  def create
    if @client.save
      redirect_to client_path(@client), notice: 'Client created successfully!'
    else
      render :new
    end
  end

  def show
    @workout = @client.workouts.order(:date).reverse
    @goal = @client.goals
    @food_log = @client.food_logs.order(:date).reverse
  end

  def edit
  end

  def update
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

    def verify_user_access
      unless current_user == @client || current_user.admin
        render file: 'public/404.html', status: :not_found, layout: false
      end
    end

    def set_client
      @client = Client.find(params[:id])
    end
  end
