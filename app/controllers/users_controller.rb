class UsersController < ApplicationController
  #remove after testing ##############################
  def index
    @Users = User.all
    # render json: "HELLO"  #works
    object = {user: {data: 1, moredata: 2}}
    render json: object                       #also works
  end

  def new
  end

  def create
  end
end
