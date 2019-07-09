Rails.application.routes.draw do
  resources :offers
  scope '/api' do
    post 'user_token' => 'user_token#create'
    resources :items
    resources :users
    post '/items/:id/offer', to: 'items#create_offer'
  end
end
