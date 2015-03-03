class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workout_path(@workout), notice: 'Workout created successfully!'
    else
      render :new
    end
  end

  def show
    @workout = Workout.find(params[:id])
  end

end
