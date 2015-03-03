class AssessmentsController < ApplicationController

  def index
    @assesments = Assessment.all
    @clients = Client.all
  end

  def new
    @assessments = Assessment.new
  end

  def create
    @assessment = Assessment.new(assessment_params)
    if @assessment.save
      redirect_to assessment_path(@assessment), notice: 'Assessment created successfully!'
    else
      render :new
    end
  end

  def show
    @assessment = Assessment.find(params[:id])
    @client = @assessment.client
  end

  def edit
    @assessment = Assessment.find(params[:id])
  end

  def update
    @assessment = Assessment.find(params[:id])
    if @assessment.update(assessment_params)
      flash[:notice] = "Assessment updated successfully!"
      redirect_to assessment_path(@assessment)
    else
      render :edit
    end
  end

  def destroy
    assessment = Assessment.find(params[:id])
    assessment.destroy
   flash[:notice] = "Deleted Assessment"
   redirect_to assessment_path
  end


    private

    def assessment_params
      params.require(:assessment).permit( :assessment_name, :assessment_date, :overhead_squat, :single_leg_squat,
       :right_hip_strength, :left_hip_strength, :shoulder_mobility,
       :right_glute_activation, :left_glute_activation, :plank, :right_plank, :left_plank,
       :leg_lowering, :push_up, :blood_pressure, :weight, :height, :client_id)
    end
end
