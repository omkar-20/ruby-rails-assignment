class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
  
    def create
      user = User1.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        token = encode_token({ user_id: user.id })
        render json: { token: token}, status: :ok
      else
        render json: { error: 'Invalid username or password'}, status: :unauthorized
      end
    end
  
    private
  
    def encode_token(payload)
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
  
end
