Api::Partials::Engine.routes.draw do  
  post :render, to: "render#render_api_partial"
end

Rails.application.routes.draw do
  mount Api::Partials::Engine => "api_partials"
end