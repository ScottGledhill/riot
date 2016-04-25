class LeagueController < ApplicationController

  def index
    @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/game/by-summoner/85098161/recent?api_key=#{ENV['LOL_KEY']}")
    @json = JSON.parse(@client)
    @json.select {|win| @json["win"]}
  end
  #
  def win
    counter = 0
    @json.each do
      if @json["win"] = true
        counter += 1
      end
    end
  end
end
