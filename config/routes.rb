Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, :controllers => {sessions: 'api/sessions', registrations: 'api/registrations'}
    post 'reset_password', to: 'api/resets_passwords#reset'
  end
end


#     Prefix                Verb      URI Pattern                                 Controller#Action
# new_user_session          GET       /api/users/sign_in(.:format)                api/sessions#new {:format=>:json}            
# user_session              POST      /api/users/sign_in(.:format)                api/sessions#create {:format=>:json}
# destroy_user_session      DELETE    /api/users/sign_out(.:format)               api/sessions#destroy {:format=>:json}

# new_user_password         GET       /api/users/password/new(.:format)           devise/passwords#new {:format=>:json}
# edit_user_password        GET       /api/users/password/edit(.:format)          devise/passwords#edit {:format=>:json}            
# user_password             PATCH     /api/users/password(.:format)               devise/passwords#update {:format=>:json}    
#                           PUT       /api/users/password(.:format)               devise/passwords#update {:format=>:json}
#                           POST      /api/users/password(.:format)               devise/passwords#create {:format=>:json}
# reset_password            POST      /api/reset_password(.:format)               api/resets_passwords#reset {:format=>:json}

# cancel_user_registration  GET       /api/users/cancel(.:format)                 api/registrations#cancel {:format=>:json}
#     new_user_registration GET       /api/users/sign_up(.:format)                api/registrations#new {:format=>:json}
#    edit_user_registration GET       /api/users/edit(.:format)                   api/registrations#edit {:format=>:json}        
#    user_registration      PATCH     /api/users(.:format)                        api/registrations#update {:format=>:json}
#                           PUT       /api/users(.:format)                        api/registrations#update {:format=>:json}                          
#                           DELETE    /api/users(.:format)                        api/registrations#destroy {:format=>:json}
#                           POST      /api/users(.:format)                        api/registrations#create {:format=>:json}