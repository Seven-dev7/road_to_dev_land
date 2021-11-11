require "addressable/uri"

module CodewarsService
  class Search
    def initialize(user:)
      @user = user
      @nickname = user.user_profile.codewars_nickname
    end

    def process
      save_data
    end

    private

    def save_data
      if @user.codewars_info
        CodewarsInfo.update!(
          username: parsed_json['username'],
          name: parsed_json['name'],
          clan: parsed_json['clan'],
          honor: parsed_json['honor'],
          leaderboard_position: parsed_json['leaderboardPosition'],
          total_authored: parsed_json["codeChallenges"]['totalAuthored'],
          total_completed: parsed_json["codeChallenges"]['totalCompleted']
        )
      else
        CodewarsInfo.create!(
          username: parsed_json['username'],
          name: parsed_json['name'],
          clan: parsed_json['clan'],
          honor: parsed_json['honor'],
          leaderboard_position: parsed_json['leaderboardPosition'],
          total_authored: parsed_json["codeChallenges"]['totalAuthored'],
          total_completed: parsed_json["codeChallenges"]['totalCompleted'],
          user_id: @user.id
        )
      end
    end

    def parsed_json
      @parsed_json ||= JSON.parse(fetch.body)
    end

    def fetch
      Faraday.get "#{url}"
    end

    def url
      url ||= Addressable::URI.parse("https://www.codewars.com/api/v1/users/#{@nickname}").normalize
    end
  end
end
