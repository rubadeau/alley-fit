class RegistrationsController < PrivateController

  def new
    @client= Client.new
  end

  def create
    @client= Client.new(reg_params)
    if @client.save
      session[:client_id] = @client.id
      flash[:notice] = "You have successfully signed up"
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  private

  def reg_params
    params.require(:client).permit(:name, :password, :email, :password_confirmation)
  end

end
