Rails.application.routes.draw do
  root 'static_pages#home'
  
  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'users/create'

  get 'users/destroy'

  get 'users/edit'

  get 'users/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
