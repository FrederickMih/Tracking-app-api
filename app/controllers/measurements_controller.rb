 class MeasurementsController < ApplicationController
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
    end
 