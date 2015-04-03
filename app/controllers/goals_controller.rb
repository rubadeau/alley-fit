class GoalsController < ClientController

  before_action :authenticate_user
  before_action :set_trainer
  before_action :set_client
  before_action :set_goal, only: [:show, :edit, :update, :destroy]


  def new
    @goal = Goal.new
  end

  def create
    @goal = @client.goals.new(goal_params)
    if @goal.save
      redirect_to trainer_client_path(@trainer, @client), notice: 'Goal created successfully!'
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
      redirect_to trainer_client_goal_path(@trainer, @client, @goal)
    else
      render :edit
    end
  end

  def destroy
   goal = @client.goals.find(params[:id])
   goal.destroy
   flash[:notice] = "Deleted Goal"
   redirect_to trainer_client_path(@trainer, @client)
  end


  private

  def goal_params
    params.require(:goal).permit(:target_date, :goal_name, :goals, :completed, :client_id, :created_at, :updated_at)
  end

  def set_client
    @client = @trainer.clients.find(params[:client_id])
  end

  def set_trainer
    @trainer = Trainer.find(params[:trainer_id])
  end

  def set_goal
    @goal = @client.goals.find(params[:id])
  end
end
