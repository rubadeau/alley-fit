class AuthenticationController < ClientsController

  def new
    session[:client_id] = current_user
  end

  def create
    client = Client.find_by(email: params[:email])
    if client && client.authenticate(params[:password])
      session[:client_id] = client.id
      flash[:notice] ="You have successfully signed in"
      redirect_to client_path(client)
    else
      @sign_in_error = "Email / Password combination is invalid"
      render :new
    end
  end

  def destroy
    session[:client_id] = nil
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end

end
