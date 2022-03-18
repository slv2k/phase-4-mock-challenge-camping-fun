class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entry_response

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by(id: params[:id])
        render json: camper
    end

    def create
        camper = Camper.create(camper_params)
        render json: camper, status: :created
    end

    private

    def render_not_found_response
        render json: { error: "Camper not found" }, status: :not_found
    end

    def render_unprocessable_entry_response
        render json: { errors: invalid.record.errors }, status: :unprocessable_entry
    end

    def camper_params
        params.permit(:name, :age)
    end

end
