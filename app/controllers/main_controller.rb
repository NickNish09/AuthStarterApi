# Controller voltado para requisições gerais
class MainController < ApplicationController
  def index
    render json: {api_version: "1.0"}
  end
end
