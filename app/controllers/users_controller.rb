class UsersController < ApplicationController
  before_filter :require_current_user!, :only => [:index, :show]
  before_filter :require_no_current_user!, :only => [:create, :new]

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to user_url(@user)
    else
      render :json => @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all.select do |user|
      user != current_user
    end
  end

  def show
    if !params.include?(:id)
      redirect_to user_url(current_user)
      return
    end
    @tags = Tag.all

    @user = User.find(params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user.received_secrets }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

