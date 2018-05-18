# class UsersController < ApplicationController
class UsersController < ActionController::API
  #remove after testing ##############################

  # def index
  #   @Users = User.all
  #   # render json: "HELLO"  #works
  #   object = {user: {data: 1, moredata: 2}}
  #   render json: object                       #also works
  # end
  #
  # def new
  # end

  def create
    if params[:firstname] && params[:lastname] && params[:email]  && params[:password]
      firstname = params[:firstname]
      lastname = params[:lastname]
      email = params[:email]
      password = params[:password]
      render json: {"ok": "we made it to create"}
    else
      render json: {"error": "Missing create data"}
    end #if
  end #create
end#class
