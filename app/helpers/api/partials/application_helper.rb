module Api
  module Partials
    module ApplicationHelper

      def api_partial(partial:, format: ,locals:, tags:nil)
        data = { partial: partial }.merge(locals)
        options = data.map { |k, v| ["data-locals_#{k}", v] }.to_h
        options["data-response_format"] = format
        options[:class] = 'api-partial'
        options["data-tags"] = tags.map(&:to_s).to_s if tags
        content_for :api_partials do
          javascript_tag(render partial:"api_partials/#{partial}/script.js")    
        end
        content_tag(:div, (render partial: "api_partials/#{partial}/view", locals: locals), options)
      end

    end
  end
end
