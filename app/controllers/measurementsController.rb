class MeasurementsController < ApplicationController 
    def index
        render json: { status: "It's working" }
    end
end