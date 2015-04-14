class TrainerRegistrationsController < ApplicationController

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_reg_params)
    if @trainer.save
      session[:client_id] = @trainer.id
      flash[:notice] = "You have successfully signed up"
      redirect_to trainer_path(@trainer)
    else
      render :new
    end
  end

  private

  def trainer_reg_params
    params.require(:trainer).permit(:name, :password, :email, :password_confirmation)
  end

end
