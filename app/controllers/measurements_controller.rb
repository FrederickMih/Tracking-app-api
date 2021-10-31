class MeasurementsController < ApplicationController
  before_action :set_measurement, only: %i[show update destroy]
  before_action :check_role, except: %i[index show]

  # GET /measurements
  def index
    @measurements = Measurement.all

    json_response(@measurements)
  end

  # POST /measurements
  def create
    @measurement = measurement.create!(measurement_params)
    json_response(@measurement, :created)
  end

  # GET /measurements/:id
  def show
    json_response(@measurement)
  end

  # PUT /measurements/:id
  def update
    @measurement.update(measurement_params)
    json_response(@measurement, :ok)
  end

  # DELETE /measurements/:id
  def destroy
    @measurement.destroy
    json_response({ id: @measurement.id }, :ok)
  end

  private

  def measurement_params
    params.permit(
      :name,
      :image_url
    )
  end

  def set_measurement
    @measurement = measurement.find(params[:id])
  end

  def check_role
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless current_user.role == 'admin'
  end
end