class SignupsController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entry_response

    def create
        signup = Signup.create(signup_params)
        render json: signup, status: :created
    end

    private

    def render_unprocessable_entry_response
        render json: { errors: invalid.record.errors }, status: :unprocessable_entry
    end

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    # resources :signups, only: [:create]

end
