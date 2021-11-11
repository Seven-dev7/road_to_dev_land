class StaticPagesController < ApplicationController
  def index
  end

  def codewars_search
    
  end

  def search_content
    return redirect_to codewars_search_path, alert: "Veuillez entrer un pseudo valide" unless params[:nickname].present?

    @response_body = CodewarsService::Search.by_nickname(nickname: params[:nickname]).body
    @response_content = JSON.parse(@response_body)
  end
end
