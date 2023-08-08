# app/controllers/application_controller.rb
# frozen_string_literal: true

class ApplicationController < ActionController::API
  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JwtService.decode(header)
      unless @decoded.present? 
      	render json: { errors: "Invalid Token" }, status: :unauthorized
      else	
      	@current_user = User.find(@decoded[:user_id])
      end	
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
