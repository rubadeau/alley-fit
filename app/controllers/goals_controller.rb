class GoalsController < ApplicationController

  before_action :find_client


  def new
    @goal = Goal.new
  end

  def create
    @goal = @client.goals.new(goal_params)
    if @goal.save
      redirect_to client_path(@client), notice: 'Goal created successfully!'
    else
      render :new
    end
  end

  def show
    @goal = @client.goals.find(params[:id])
  end

  def edit
    @goal = @client.goals.find(params[:id])
  end

  def update
    @goal = @client.goals.find(params[:id])
    if @goal.update(goal_params)
      flash[:notice] = "Goal updated successfully!"
      redirect_to client_goal_path(@client, @goal)
    else
      render :edit
    end
  end

  def destroy
   goal = @client.goals.find(params[:id])
   goal.destroy
   flash[:notice] = "Deleted Goal"
   redirect_to client_path(@client)
  end


  private

  def goal_params
    params.require(:goal).permit(:target_date, :goal_name, :goals, :completed, :client_id, :created_at, :updated_at)
  end

  def find_client
    @client = Client.find(params[:client_id])
  end
end
