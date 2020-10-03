class UsersController < ApplicationController
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
        format.html {redirect_to current_user, notice: 'You successfully updated your profile'}
      else
        format.html{ render :edit }
      end
    end
  end

  def delete_image
    image = ActiveStorage::Attachment.find(params[:image_id])
    if current_user == image.record || current_user.admin?
      image.purge
      redirect_back(fallback_location: request.referer)
    else
      redirect_to root_url, notice: "Ah ah ah, you didn't say the magic word"
    end
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
