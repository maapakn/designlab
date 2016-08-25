Rails.application.routes.draw do

  mount Spree::Core::Engine, :at => '/'

  Spree::Core::Engine.routes.draw do
    get "pedidos/express"
    get "transactions/checkout"
    get 'search/create'
    get "/ayuda", to: "home#ayuda"
    get'/activos', to: "pedidos#activos"
    get'/reportes', to: "reportes#reportes"
    get'reportes/paciente', to: "reportes#paciente"
    get'reportes/trabajo', to: "reportes#trabajo"
    get'reportes/material', to: "reportes#material"
    get'reportes/fecha', to: "reportes#fecha"
    get'reportes/gasto', to: "reportes#gasto"
    get'show_activos/:id' => 'pedidos#show_activos', :as => 'show_activos'
    resources :activities
    resources :payments
    resources :zonas
    resources :dientes
    resources :pedidos
    get 'activos/autocomplete_pedido_id'
    get 'pedidos_autocomplete_pedido_nombres'
    
    namespace :admin, path: Spree.admin_path do
      # ...
      resources :pedidos
      resources :materials 
      resources :trabajos
      resources :categories
      # ...
    end
  end
end
