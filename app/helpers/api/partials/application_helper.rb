module Api
  module Partials
    module ApplicationHelper

      def api_partial(partial:, format: ,locals:, tags:nil)
        data = { partial: partial }.merge(locals)
        options = {}
        options[:class] = 'api-partial'
        options["data-locals"] = data.to_json      
        options["data-response_format"] = format
        options["data-tags"] = tags.to_json if tags            
        content_for :api_partials do
          javascript_tag(render partial:"api_partials/#{partial}/script.js")
        end
        content_tag(:div, render(partial: "api_partials/#{partial}/view", locals: locals), options)
      end

    end
  end
end
