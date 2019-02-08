module Api
  module Partials
    class Engine < ::Rails::Engine
      isolate_namespace Api::Partials
      ActiveSupport.on_load( :action_view ){ include Api::Partials::ApplicationHelper }
    end
  end
end
