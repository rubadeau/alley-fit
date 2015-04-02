class WorkoutsController < ApplicationController

  before_action :authenticate_user
  before_action :set_trainer
  before_action :set_client
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = @client.workouts.new(workout_params)
    if @workout.save
      redirect_to trainer_client_path(@trainer, @client), notice: 'Workout created successfully!'
    else
      render :new
    end
  end

  def show
    @workout = @client.workouts.find(params[:id])
  end

  def edit
    @workout = @client.workouts.find(params[:id])
  end

  def update
    @workout = @client.workouts.find(params[:id])
    if @workout.update(workout_params)
      flash[:notice] = "Workout updated successfully!"
      redirect_to trainer_client_workout_path(@trainer, @client, @workout)
    else
      render :edit
    end
  end

  def destroy
   workout = @client.workouts.find(params[:id])
   workout.destroy
   flash[:notice] = "Deleted Workout"
   redirect_to client_path(@client)
  end


  private

  def workout_params
    params.require(:workout).permit(:date, :time, :workout, :comments, :client_id)
  end

  def set_client
    @client = @trainer.clients.find(params[:client_id])
  end

  def set_trainer
    @trainer = Trainer.find(params[:trainer_id])
  end

  def set_workout
    @workout = @client.workouts.find(params[:id])
  end
end
