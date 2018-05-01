Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :foods, only: [:index, :show, :destroy, :create]
      resources :meals, only: [:index]
      get '/meals/:id/foods', to: 'meals#show'
      namespace 'meals' do
        delete '/:meal_id/foods/:id', to: 'foods#destroy'
      end
    end
  end
end
