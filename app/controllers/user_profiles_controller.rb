class UserProfilesController < ApplicationController
  helper_method :user_profile

  def show
    parsing_response
  end

  def edit
    
  end

  def update
    user_profile.update!(user_profile_params)
    redirect_to user_profile_path(user_profile), alert: 'Profile modifié'
  end

  private

  def parsing_response
    value = response_call
    @parsed_data = {
      username: value['username'],
      name: value['name'],
      clan: value['clan'],
      honor: value ['honor'],
      leaderboardPosition: value['leaderboardPosition'],
      totalAuthored: value["codeChallenges"]['totalAuthored'],
      totalCompleted: value["codeChallenges"]['totalCompleted']
    }
  end
  
  def response_call
    @response_content = JSON.parse(CodewarsService::Search.by_nickname(nickname: user_profile.codewars_nickname).body)
  end
  
  def user_profile
    user_profile = UserProfile.find(params[:id])
  end

  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :codewars_nickname, :city, :country, :date_of_birth)
  end
end
