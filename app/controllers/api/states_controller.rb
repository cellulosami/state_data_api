class Api::StatesController < ApplicationController
  #/api/states
  def index
    @data = []

    CSV.foreach(Rails.root.join('lib/state_data.csv'), headers: true, converters: :all) do |row|
      @data << row.to_hash
    end

    render json: @data
  end

  #/api/states/:abbr
  def show
    #convert abbr to state name
    state = nil
    CSV.foreach(Rails.root.join('lib/abbreviations.csv'), headers: true, converters: :all) do |row|
      hash = row.to_hash
      if hash["Code"] == params[:abbr]
        state = hash["State"]
        break
      end
    end

    #convert state name to state data
    data = nil
    CSV.foreach(Rails.root.join('lib/state_data.csv'), headers: true, converters: :all) do |row|
      hash = row.to_hash
      if hash["state"] == state
        data = hash
        break
      end
    end

    render json: data
  end
end
