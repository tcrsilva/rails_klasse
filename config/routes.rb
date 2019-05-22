Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: "users/sessions", passwords: 'users/passwords' } do
    get "/", :to => "users/sessions#create"
  end

  authenticated :user do
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "users/sessions#new"
    end
  end
    get 'devise/sessions/new'
    root to: "home#index"
    get 'home/index'
end
