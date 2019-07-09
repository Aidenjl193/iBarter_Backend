Rails.application.routes.draw do
  resources :offers
  scope '/api' do
    post 'user_token' => 'user_token#create'
    resources :items
    resources :users
  end
end
