class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:show]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html {redirect_to current_user, notice:'Haz actualizado correctamente tu perfil'}
      else
        format.html {render :edit}
      end
    end
  end

  # DELETE User/:id/delete_image/:image_id
  def delete_image
    image = ActiveStorage::Attachment.find(params[:image_id])
    if current_user == image.record || current_user.admin?
      image.purge
      redirect_back(fallback_location: request.referer)
    else
      redirect_to root_url, notice:"OPPS, No dijiste la palabra magica!!"
    end
  end
  
  # POST user/:id
  def to_author
    current_user.author
  end

  


  private

  def user_params
    params.require(:user).permit(
      :bio,
      :first_name,
      :last_name,
      :profile_picture,
     
      )
  end

end
