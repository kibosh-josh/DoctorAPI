Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/doctors' => 'doctors#index'
      get '/cchp' => 'doctors#cchp_HMO'
      get '/blue_cross' => 'doctors#blue_cross'
      get '/blue_shield' => 'doctors#blue_shield_PPO'
      get '/kaiser' => 'doctors#kaiser_HMO'
      get '/cchp_EPO' => 'doctors#cchp_EPO'
      get '/blue_cross_HMO' => 'doctors#blue_cross_HMO'
      get '/blue_shield_EPO' => 'doctors#blue_shield_EPO'
    end
  end
end