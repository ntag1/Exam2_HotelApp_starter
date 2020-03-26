Rails.application.routes.draw do
  resources :rooms
  resources :bookings
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'booked_rooms' => 'rooms#booked'



end
