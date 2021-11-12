require "addressable/uri"

module CodewarsService
  class Search
    def initialize(user:)
      @user = user
      @nickname = user.user_profile.codewars_nickname
    end

    def process
      update_data
    end

    private

    def update_data
      instantiate_codewars_info.update!(
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

    def instantiate_codewars_info
      @codewars_info ||= CodewarsInfo.new
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
