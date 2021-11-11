class StaticPagesController < ApplicationController
  def index
  end

  def codewars_search
    
  end

  def search_content
    return redirect_to codewars_search_path, alert: "Veuillez entrer un pseudo valide" unless params[:nickname].present?

    response = CodewarsService::Search.by_nickname(nickname: params[:nickname])
    return redirect_to codewars_search_path, alert: "Pseudo Non-enregistré sur Code Wars" unless response.status == 200

    parsing_response(response: response)
  end

  private

  def parsing_response(response:)
    value = response_call(content: response)
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
  
  def response_call(content:)
    JSON.parse(content.body)
  end
end
