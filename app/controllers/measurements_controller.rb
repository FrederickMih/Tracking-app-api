class MeasurementsController < ApplicationController
  include CurrentUserConcern

  def index
    if @current_user
      measurements = Measurement.all
      render json: { measurements: measurements, status: :ok }
    else
      render json: { status: 401 }
    end
  end

  def show
    measurement = set_measurement

    user = @current_user

    render json: { measurement: measurement, user: user, status: :ok }
  end

  private

  def set_measurement
    Measurement.find_by_id params[:id]
  end
end
