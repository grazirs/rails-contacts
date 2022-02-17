class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(name:params["name"], age:params["age"], bio:params["bio"])
    if user.save()
      redirect_to user
    else 
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
