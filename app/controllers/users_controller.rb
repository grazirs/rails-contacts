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
    @user = User.find_by(id: params[:id])
  end

  def update
    begin
      user = User.find_by(id: params["id"])
      user.update!(name:params["name"], age:params["age"], bio:params["bio"])
      redirect_to user
    rescue => exception
      redirect_to controller: 'users', action: 'edit', id: params[:id]
    end
  end

  def destroy
  end
end
