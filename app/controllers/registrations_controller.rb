class RegistrationsController < ApplicationController

  def new
    @client= Client.new
  end

  def create
    @client= Client.new(client_params)
    if @client.save
      session[:client_id] = @client.id
      flash[:notice] = "You have successfully signed up"
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :password, :email, :password_confirmation)
  end

end
