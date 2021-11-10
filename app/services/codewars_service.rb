require "addressable/uri"

module CodewarsService
  class Search
    def self.by_nickname(nickname:)
      url = Addressable::URI.parse("https://www.codewars.com/api/v1/users/#{nickname}").normalize
      Faraday.get "#{url}"
    end
  end
end
