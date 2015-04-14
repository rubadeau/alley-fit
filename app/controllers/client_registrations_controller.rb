class ClientRegistrationsController < ApplicationController

  def new
    @client= Client.new
  end

  def create
    @trainer = Trainer.find(params[:trainer_id])
    @client = Client.new(reg_params)
    if @client.save
      session[:client_id] = @client.id
      flash[:notice] = "You have successfully signed up"
      redirect_to trainer_client_path(@trainer.id, @client)
    else
      render :new
    end
  end

  private

  def reg_params
    params.require(:client).permit(:name, :password, :email, :password_confirmation, :trainer_id)
  end

end
