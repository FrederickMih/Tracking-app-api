class MeasuresController < ApplicationController
  # GET /measures
  def index
    @measures = current_user.measures.all.order(created_at: :DESC)
    json_response(@measures)
  end

  # POST /measures
  def create
    @measures = current_user.measures.create!(measure_params[:measures])
    json_response(@measures, :created)
  end

  private

  def measure_params
    params.permit(
      measures: %i[measurement_id value created_at]
    )
  end
end