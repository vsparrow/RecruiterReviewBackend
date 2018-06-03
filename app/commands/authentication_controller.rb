# require 'jwt'
require_relative '../../lib/json_web_token.rb'

class AuthenticationController < ApplicationController
 skip_before_action :authenticate_request

 def authenticate
   command = AuthenticateUser.call(params[:email], params[:password])
   user = User.find_by(email: params[:email]) ##################################added for review create, not needed for auth
   if command.success?
     render json: { auth_token: command.result, user_id: user.id }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end
end
