Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :foods, only: [:index, :show, :destroy, :create, :update]
      resources :meals, only: [:index]
      get '/meals/:id/foods', to: 'meals#show'
      namespace 'meals' do
        delete '/:meal_id/foods/:id', to: 'foods#destroy'
        post '/:meal_id/foods/:id', to: 'foods#create'
      end
    end
  end
end
