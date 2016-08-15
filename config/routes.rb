Rails.application.routes.draw do
  # namespace :admin do
  #   resources :typeforms
  # end
  resources :typeforms, only: [] do
    get 'view' => 'typeforms#view', as: :view
    get 'check' => 'typeforms#check'
  end
end