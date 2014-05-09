class SecretsController < ApplicationController
  def new
    @secret = Secret.new
    @user = User.find(params[:user_id])
  end

  def create
    @secret = Secret.new(secret_params)
    @secret.author_id = current_user.id

    if @secret.try(:save)
      redirect_to user_url(@secret.recipient_id)
    else
      flash[:errors] = @secret.errors.full_messages
      redirect_to user_url(@secret.recipient_id)
    end

  end

  private
  def secret_params
    params.require(:secret).permit(:title, :recipient_id)
  end

end
