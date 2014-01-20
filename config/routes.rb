Omnisand::Engine.routes.draw do
  devise_scope :user do
  get "/users/auth/:provider/callback" => "omniauth_callbacks#callback"
  end
  devise_for :users, controllers: { omniauth_callbacks: "omnisand/omniauth_callbacks" }
end
