Rails.application.routes.draw do
  get '/', to: redirect('/tests')

  resources :tests, only: [:index, :show] do
    post :solve
    get :results

    resources :solutions, only: :show
  end
end
