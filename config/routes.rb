Rails.application.routes.draw do
  namespace :api do
    get "/states" => "states#show"
  end
end
