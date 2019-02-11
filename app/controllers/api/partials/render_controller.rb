class Api::Partials::RenderController < ApplicationController
  skip_before_action :verify_authenticity_token
  include Rails.application.routes.url_helpers

  def render_api_partial
    render partial: "/api_partials/#{api_partial_params[:partial]}/response", locals: api_partial_params[:locals].to_h.deep_symbolize_keys, :format => api_partial_params[:response_format]
  end

  private

  def api_partial_params
    params.require(:api_partial).permit(:partial, :response_format, locals: {})
  end

  
end