Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/doctors' => 'doctors#index'
      get '/cchp' => 'doctors#cchp'
      get '/blue_cross' => 'doctors#blue_cross'
      get '/blue_shield' => 'doctors#blue_shield'
      get '/kaiser' => 'doctors#kaiser'
    end
  end
end
#             Prefix Verb URI Pattern                   Controller#Action
#     api_v1_doctors GET  /api/v1/doctors(.:format)     api/v1/doctors#index {:format=>"json"}
#        api_v1_cchp GET  /api/v1/cchp(.:format)        api/v1/doctors#cchp {:format=>"json"}
#  api_v1_blue_cross GET  /api/v1/blue_cross(.:format)  api/v1/doctors#blue_cross {:format=>"json"}
# api_v1_blue_shield GET  /api/v1/blue_shield(.:format) api/v1/doctors#blue_shield {:format=>"json"}
#      api_v1_kaiser GET  /api/v1/kaiser(.:format)      api/v1/doctors#kaiser {:format=>"json"}
