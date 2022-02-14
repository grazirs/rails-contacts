Rails.application.routes.draw do
  get 'users' => 'users#index'
  get 'users/show'
  get 'users/new'
  post 'users/create'
  get 'users/edit'
  put 'users/update'
  delete 'users/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
