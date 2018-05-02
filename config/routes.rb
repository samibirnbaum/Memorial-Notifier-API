Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    devise_for :users
  end
end

# Prefix                         Verb     URI Pattern                                  Controller#Action
# new_api_user_session           GET      /api/users/sign_in(.:format)                 api/sessions#new {:format=>:json}                                                            
# api_user_session               POST     /api/users/sign_in(.:format)                 api/sessions#create {:format=>:json}
# destroy_api_user_session       DELETE   /api/users/sign_out(.:format)                api/sessions#destroy {:format=>:json}

# new_api_user_password          GET      /api/users/password/new(.:format)            api/passwords#new {:format=>:json}
# edit_api_user_password         GET      /api/users/password/edit(.:format)           api/passwords#edit {:format=>:json}
#    api_user_password           PATCH    /api/users/password(.:format)                api/passwords#update {:format=>:json}son}                                                                                                                                                     
#                                PUT      /api/users/password(.:format)                api/passwords#update {:format=>:json}son}                                                                                                                                                       
#                                POST     /api/users/password(.:format)                api/passwords#create {:format=>:jjson}son}                                                                                                                                                      

# cancel_api_user_registration   GET      /api/users/cancel(.:format)                  api/registrations#cancel {:format=>:json}                                                                                                                                                   
# new_api_user_registration      GET      /api/users/sign_up(.:format)                 api/registrations#new {:format=>:t=>:json}                                                                                                                                                        
# edit_api_user_registration     GET      /api/users/edit(.:format)                    api/registrations#edit {:format=>:json}                                                                                                                                                        
# api_user_registration          PATCH    /api/users(.:format)                         api/registrations#update {:format=>:json}
#                                PUT      /api/users(.:format)                         api/registrations#update {:format=>:json}                                                                             
#                                DELETE   /api/users(.:format)                         api/registrations#destroy {:format=>:json}
#                                POST     /api/users(.:format)                         api/registrations#create {:format=>:json}                                                                                               