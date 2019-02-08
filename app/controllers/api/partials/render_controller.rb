class Api::Partials::RenderController < ApplicationController
  skip_before_action :verify_authenticity_token

  def render_api_partial
    render partial: "/api_partials/#{api_partial_params[:partial]}/render", locals: api_partial_params[:locals].to_h.deep_symbolize_keys
  end

  private

  def api_partial_params
    params.require(:api_partial).permit(:partial, locals: {})
  end

  
end