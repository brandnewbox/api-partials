module Api
  module Partials
    class Engine < ::Rails::Engine
      isolate_namespace Api::Partials
    end
  end
end
