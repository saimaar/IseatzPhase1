Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/cuisines', to: "cuisines#cuisines"
  get '/reviews', to: "reviews#reviews"

end
