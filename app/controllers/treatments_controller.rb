class TreatmentsController < ApplicationController
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]
  def index
    if user_signed_in?
      @treatments = Treatment.where(user_id: current_user.id).order(:created_at)
    end

    if doctor_signed_in?
      @treatments = Treatment.where(doctor_id: current_doctor.id).order(:created_at)
    end
  end

  def new
    @treatment = Treatment.new
  end

  def create
    @treatment = Treatment.new(treatment_params)
    @treatment.doctor_id = current_doctor.id
    respond_to do |format|
      if @treatment.save
        format.html { redirect_to @treatment, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @treatment }
      else
        format.html { render :new }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html { redirect_to @treatment, notice: 'list was successfully updated.' }
        format.json { render :show, status: :ok, location: @treatment }
      else
        format.html { render :edit }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @treatment.destroy
    respond_to do |format|
      format.html { redirect_to treatments_url, notice: 'treatment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_treatment
    @treatment = Treatment.find(params[:id])
  end

  def treatment_params
    params.require(:treatment).permit(:disease_id, :complaints, :user_id, :doctor_id)
  end
end
