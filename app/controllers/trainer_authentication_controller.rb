class TrainerAuthenticationController < ApplicationController

  def new
    session[:trainer_id] = current_user
  end

  def create
    @trainer = Trainer.find_by(email: params[:email])
    if @trainer && @trainer.authenticate(params[:password])
      session[:trainer_id] = @trainer.id
      flash[:notice] ="You have successfully signed in"
      redirect_to trainer_path(@trainer)
    else
      @sign_in_error = "Email / Password combination is invalid"
      render :new
    end
  end

  def destroy
    session[:trainer_id] = nil
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end

end
