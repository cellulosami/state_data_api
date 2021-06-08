class Api::StatesController < ApplicationController
  def show
    @data = []

    CSV.foreach(Rails.root.join('lib/state_data.csv'), headers: true, converters: :all) do |row|
      @data << row.to_hash
    end

    @data = @data.to_json

    render json: @data
  end
end
