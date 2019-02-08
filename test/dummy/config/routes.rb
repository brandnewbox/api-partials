Rails.application.routes.draw do
  mount Api::Partials::Engine => "/api-partials"
end
