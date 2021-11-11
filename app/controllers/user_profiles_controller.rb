class UserProfilesController < ApplicationController
  helper_method :user_profile, :codewars_info

  def update
    user_profile.update!(user_profile_params)
    redirect_to user_profile_path(user_profile), alert: 'Profile modifié'
  end

  def codewars_data
    CodewarsService::Search.new(user: user_profile.user).process
    redirect_to user_profile_path(user_profile), alert: 'Infos bien mis à jour'
  end

  private

  
  def codewars_info
    @codewars_info ||= user_profile.user.codewars_info
  end
  
  def user_profile
    @user_profile ||= UserProfile.find(params[:id])
  end

  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :codewars_nickname, :city, :country, :date_of_birth)
  end
end
