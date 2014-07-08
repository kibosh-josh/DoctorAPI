Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/doctors' => 'doctors#index'
      get '/cchp' => 'doctors#cchp'
      get '/blue_cross' => 'doctors#blue_cross'
      get '/blue_cross_HMO' => 'doctors#blue_cross_HMO'
      get '/blue_shield' => 'doctors#blue_shield_PPO'
      get '/blue_shield_EPO' => 'doctors#blue_shield_EPO'
      get '/kaiser' => 'doctors#kaiser_HMO'
    end
  end
end