class SecretsController < ApplicationController
  def new
    @secret = Secret.new
    @user = User.find(params[:user_id])
  end

  def create
    @secret = Secret.new(secret_params)
    @secret.author_id = current_user.id

    @secret.try(:save)

    respond_to do |format|
      # format.html { redirect_to users_url }
      format.json { render json: @secret }
    end


  end

  private
  def secret_params
    params.require(:secret).permit(:title, :recipient_id, :tag_ids => [])
  end

end
