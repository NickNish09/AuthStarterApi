module V1
  class UserController < ApplicationController
    before_action :require_user

    def current_user_data
      render json: current_user
    end
    private

    def require_user
      unless user_signed_in?
        render json: { error: 'você precisa estar autenticado ter acesso' }, status: :unauthorized
      end
    end
  end
end