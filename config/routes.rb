Rails.application.routes.draw do
  root 'campaigns#index'
  get '/:campaign' => 'campaigns#show'
end
