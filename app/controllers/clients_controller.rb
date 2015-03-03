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
      redirect_to cleints_path, notice: 'Client created successfully!'
    else
      render :new
    end
  end

end
