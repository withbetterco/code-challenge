Rails.application.routes.draw do
  scope module: :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :participants, only: %i[index create update]
    end
  end
end
