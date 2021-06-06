class Api::StatesController < ApplicationController
  def show
    @states = {
      message: "oi"
    }
    render json: @states
  end
end
