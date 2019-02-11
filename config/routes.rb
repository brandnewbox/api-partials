Api::Partials::Engine.routes.draw do  
  post :render, to: "render#render_api_partial"
end
