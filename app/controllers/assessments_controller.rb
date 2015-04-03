class AssessmentsController < ClientController

  before_action :authenticate_user
  before_action :set_trainer
  before_action :set_client
  before_action :set_assessment, only: [:show, :edit, :update, :destroy]

  def new
    @assessment = Assessment.new
  end

  def create
    @assessment = @client.assessments.new(assessment_params)
    if @assessment.save
      redirect_to trainer_client_path(@trainer, @client), notice: 'Assessment created successfully!'
    else
      render :new
    end
  end

  def show
    @assessment = Assessment.find(params[:id])
  end

  def edit
    @assessment = Assessment.find(params[:id])
  end

  def update
    @assessment = @client.assessments.find(params[:id])
      if @assessment.update(assessment_params)
      redirect_to trainer_client_path(@trainer, @client), notice: "Assessment updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    assessment = @client.assessments.find(params[:id])
    assessment.destroy
   flash[:notice] = "Deleted Assessment"
   redirect_to trainer_client_path(@trainer, @client)
  end


  private

  def assessment_params
    params.require(:assessment).permit( :assessment_name, :assessment_date, :overhead_squat,
     :single_leg_squat, :right_hip_strength, :left_hip_strength, :shoulder_mobility,
     :right_glute_activation, :left_glute_activation, :plank, :right_plank, :left_plank,
     :leg_lowering, :push_up, :blood_pressure, :weight, :height, :client_id,
     :body_fat_percentage, :bmi, :heart_rate)
  end

  def set_client
    @client = @trainer.clients.find(params[:client_id])
  end

  def set_trainer
    @trainer = Trainer.find(params[:trainer_id])
  end

  def set_assessment
    @assessment = @client.assessments.find(params[:id])
  end
end
