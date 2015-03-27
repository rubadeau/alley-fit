class FoodLogsController < ApplicationController

  before_action :find_client


  def new
    @food_log = FoodLog.new
  end

  def create
    @food_log = @client.food_logs.new(food_log_params)
    if @food_log.save
      redirect_to client_path(@client), notice: 'Food Log created successfully!'
    else
      render :new
    end
  end

  def show
    @food_log = FoodLog.find(params[:id])
  end

  def edit
    @food_log = FoodLog.find(params[:id])
  end

  def update
    @food_log = @client.food_logs.find(params[:id])
      if @food_log.update(food_log_params)
      redirect_to client_path(@client), notice: "Food Log updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    food_log = @client.food_logs.find(params[:id])
    food_log.destroy
   flash[:notice] = "Deleted Food Log"
   redirect_to client_path(@client)
  end

  private

  def food_log_params
    params.require(:food_log).permit( :date, :breakfast,
     :mid_morning_snack, :lunch, :afternoon_snack, :dinner,
     :after_dinner, :drinks, :client_coments, :trainer_feedback, :client_id)
  end

  def find_client
    @client = Client.find(params[:client_id])
  end
end
