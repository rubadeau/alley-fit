class GoalsController < ApplicationController

  before_action :find_client


  def new
    @goals = @client.goals.build
  end

  def create
    @goal = @client.goals.build(goal_params)
    if @goal.save
      redirect_to client_path(@client), notice: 'Goal created successfully!'
    else
      render :new
    end
  end

  def show
    @goal = @client.workouts.find(params[:id])
  end

  def edit
    @goal = @client.workouts.find(params[:id])
  end

  def update
    @goal = @client.workouts.find(params[:id])
    if @goal.update(workout_params)
      flash[:notice] = "Goal updated successfully!"
      redirect_to client_workout_path(@client, @goal)
    else
      render :edit
    end
  end

  def destroy
   goal = @client.workouts.find(params[:id])
   goal.destroy
   flash[:notice] = "Deleted Goal"
   redirect_to client_path(@client)
  end


  private

  def workout_params
    params.require(:goal).permit(:target_date, :goal_name, :goals, :completed, :client_id, :created_at, :updated_at)
  end

  def find_client
    @client = Client.find(params[:client_id])
  end
end
