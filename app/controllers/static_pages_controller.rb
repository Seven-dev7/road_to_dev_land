class StaticPagesController < ApplicationController
  def index
  end

  def codewars_search
    
  end

  def search_content
    return redirect_to codewars_search_path, alert: "Veuillez entrer un pseudo valide" unless params[:nickname].present?

    response = CodewarsService::Search.by_nickname(nickname: params[:nickname])
    return redirect_to codewars_search_path, alert: "Veuillez entrer un pseudo valide" unless response.status == 200

    parsing_response(hash_values: response)
  end

  private

  def parsing_response(hash_values:)
    value = response_call(content: hash_values)
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
