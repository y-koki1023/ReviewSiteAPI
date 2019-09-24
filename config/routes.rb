Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      scope 'accounts' do
        post 'register', to: 'accounts#create'
        post 'login', to: 'accounts#login'
      end
      scope 'reviews' do
        post 'register', to: 'reviews#create'
        get  'get', to: 'reviews#show'
        get  'getList', to: 'reviews#showList'
      end
    end
  end
end
