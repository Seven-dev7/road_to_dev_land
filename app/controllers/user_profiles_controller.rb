class UserProfilesController < ApplicationController
  helper_method :user_profile

  def show
    @user = user_profile.user
    @response_body = CodewarsService::Search.by_nickname(nickname: 'Seven_7').body
    @response_content = JSON.parse(@response_body)
  end

  def edit
    
  end

  def update
    @user_profile = user_profile.update!(user_profile_params)
    redirect_to user_profile_path(user_profile), alert: 'Profile modifié'
  end

  private

  def user_profile
    user_profile = UserProfile.find params[:id]
  end

  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :codewars_nickname, :city, :country, :date_of_birth)
  end
end
