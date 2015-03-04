class WorkoutsController < ApplicationController
  before_action :find_client


  def new
    @workout = @client.workouts.build
  end

  def create
    @workout = @client.workouts.build(workout_params)
    if @workout.save
      redirect_to client_path(@client), notice: 'Workout created successfully!'
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
      redirect_to client_workout_path(@client, @workout)
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

  def find_client
    @client = Client.find(params[:client_id])
  end
end
