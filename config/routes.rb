Rails.application.routes.draw do

  devise_for :users, controllers: {
  	:registrations => 'users/registrations',
  	:sessions => 'users/sessions',
  	:passwords => 'users/passwords'
  }

  devise_scope :user do

  root 'users#top'
  end
end

