Rails.application.routes.draw do
  root 'api/v1/doctors#index', defaults: {format: :json}
  namespace :api do
    root 'v1/doctors#index', defaults: {format: :json}
    namespace :v1 do
      root 'doctors#index', defaults: {format: :json}
      get '/doctors' => 'doctors#index', defaults: {format: :json}
      get '/cchp' => 'doctors#cchp', defaults: {format: :json}
      get '/blue_cross' => 'doctors#blue_cross', defaults: {format: :json}
      get '/blue_cross_HMO' => 'doctors#blue_cross_HMO', defaults: {format: :json}
      get '/blue_shield' => 'doctors#blue_shield_PPO', defaults: {format: :json}
      get '/blue_shield_EPO' => 'doctors#blue_shield_EPO', defaults: {format: :json}
      get '/kaiser' => 'doctors#kaiser_HMO', defaults: {format: :json}
    end
  end
end