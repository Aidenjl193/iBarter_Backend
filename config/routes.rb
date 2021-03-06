Rails.application.routes.draw do
  scope '/api' do
    post 'user_token' => 'user_token#create'
    resources :items
    resources :users
    resources :offers
    post '/items/:id/offer', to: 'items#create_offer'
  end
end
