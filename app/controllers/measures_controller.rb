class MeasuresController < ApplicationController
  include CurrentUserConcern

  def index
    if @current_user
      all = @current_user.measures.newest_first.group_by_date
      progress = {
        sum_data: @current_user.measures.sum_data,
        items: @current_user.measures.group_by_measurement
      }
      render json: { all: all, progress: progress, status: :ok }
    else
      render json: { status: 401 }
    end
  end

  def create
    measure = @current_user.measures.build(measure_params)
    measure.user_id = @current_user.id
    if measure.save
      render json: { measure: measure, status: :ok }
    else
      render json: { status: 'Invalid data' }, status: 400
    end
  end

  private

  def measure_params
    params.permit(:measurement_id, :data)
  end
end
