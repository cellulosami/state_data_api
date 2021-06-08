class Api::StatesController < ApplicationController
  #/api/states
  def index
    @data = []

    CSV.foreach(Rails.root.join('lib/state_data.csv'), headers: true, converters: :all) do |row|
      @data << row.to_hash
    end

    @data = @data.to_json

    render json: @data
  end

  #/api/states/:abbr
  def show
    state = false
    #convert abbr to state name
    CSV.foreach(Rails.root.join('lib/abbreviations.csv'), headers: true, converters: :all) do |row|
      hash = row.to_hash
      if hash["Code"] == params[:abbr]
        state = hash["State"]
        break
      end
    end

    render json: state
  end
end
