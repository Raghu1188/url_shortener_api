Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :urls, only: [:create]
    end
  end

  get '/:short_code', to: 'api/v1/urls#redirect'

end
