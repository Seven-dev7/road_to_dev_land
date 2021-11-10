class StaticPagesController < ApplicationController
  def index
  end

  def search
    return redirect_to root_path, alert: "Veuillez entrer un pseudo valide" unless params[:nickname].present?

    @response_body = CodewarsService::Search.by_nickname(nickname: params[:nickname]).body
    @response_content = JSON.parse(@response_body)
  end
end
