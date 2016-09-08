Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
  }

  #API
  get 'api/calc' => "api/calc_worktime#calc"
end
