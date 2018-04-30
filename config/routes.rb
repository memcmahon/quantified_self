Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :foods, only: [:index, :show]
      resources :meals, only: [:index]
    end
  end
end
