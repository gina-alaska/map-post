class UsersController < ApplicationController
  include GinaAuthentication::Users
  before_action :fetch_user, only: [:show, :ban, :unban]

  def index
    @users = User.all
  end

  def show
  end

  def ban
    @user.ban

    if params[:return_to_all].present?
      redirect_to users_path
    else
      redirect_to @user
    end
  end

  def unban
    @user.unban

    if params[:return_to_all].present?
      redirect_to users_path
    else
      redirect_to @user
    end
  end

  protected

  def fetch_user
    @user = User.find(params[:id]) if params[:id].present?
  end
end
