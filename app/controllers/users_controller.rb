class UsersController < ApplicationController

  def index
    @users = User.where(params.permit(:id,:email))

    if @users
      render status: :ok,
             json: @users.as_json
    else
      render status: :not_found,
             json: {
                 error: "users not found"
             }
    end
  end
  def movies
    @user = User.where(:id => params[:id]).first

    if @user
      render status: :ok,
             json: @user.movies.as_json
    else
      render status: :not_found,
             json: {
                 error: "User #{params[:id]} not found"
             }
    end
  end
end