Rails.application.routes.draw do
  get 'admin/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboards#show'

  post 'new_url' => 'dashboards#load'

  get 'admin' => 'admin#show'

  post 'admin' => 'admin#modify'
end
