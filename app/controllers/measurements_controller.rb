class MeasurementsController < ApplicationController
  before_action :set_measurement, only: %i[show update destroy]
  before_action :check_role, except: %i[index show]

  # GET /measurements
  def index
        @measurements = Measurement.all

        render json: @measurements.to_json
      end

      def show
        @measurement = Measurement.find(params[:id])
        @measures = Measure.where(measurement: @measurement)

        render json: @measurement.to_json(include: { measures: { only: %i[value created_at] } })
      end

      def create
        measurement = Measurement.find(measurement_params['id'])
        measure = Measure.new(measure_params.merge(measurement_id: measurement.id))

        if measure.save
          render json: measure.as_json, status: :created
        else
          render json: measure.errors, status: :unprocessable_entity
        end
      end

      private

      def measurement_params
        params.require(:measurement).permit(:id)
      end

      def measure_params
        params.require(:measure).permit(:value)
      end

  def check_role
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless current_user.role == 'admin'
  end
end