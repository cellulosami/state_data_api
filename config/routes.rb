Rails.application.routes.draw do
  namespace :api do
    get "/states" => "states#index"
    get "/states/:abbr" => "states#show"
  end
end
