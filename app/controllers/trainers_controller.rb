class TrainersController < PrivateController

  def index
    @trainers = Trainer.all
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.find(params[:id])
    if @trainer.save
      redirect_to trainer_path(@trainer), notice: 'Trainer created successfully!'
    else
      render :new
    end
  end

  def show
    @trainer = Trainer.find(params[:id])
    @clients = @trainer.clients
  end

  def edit
    @trainer = Trainer.find(params[:id])
  end

  def update
    @trainer = Trainer.find(params[:id])
    if @trainer.update(trainer_params)
      flash[:notice] = "Trainer updated successfully!"
      redirect_to trainer_path(@trainer)
    else
      render :edit
    end
  end

  def destroy
   @trainer.destroy
   flash[:notice] = "Deleted Client"
   redirect_to trainers_path
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :phone, :email,
    :additional_info, :password, )
  end

end
