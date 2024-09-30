# frozen_string_literal: true

class LocalForecastsController < ApplicationController
  rescue_from ArgumentError, with: :invalid_location
  def index
  end

  def search
    @location = params[:location]
    @forecast = LocalForecastService.new(@location).call&.deep_symbolize_keys
    if @forecast
      respond_to do |format|
        format.turbo_stream
      end
    else
      flash.now[:alert] = "Location not found"
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend(
            "flash-message",
            partial: "layouts/flash"
          )
        end
      end
    end
  end

  private

  def invalid_location
    flash.now[:alert] = "Location cannot be blank"
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.prepend(
          "flash-message",
          partial: "layouts/flash"
        )
      end
    end
  end
end
