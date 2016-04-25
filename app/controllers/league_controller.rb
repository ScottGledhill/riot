class LeagueController < ApplicationController

  def index
    @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/game/by-summoner/85098161/recent?api_key=#{ENV['LOL_KEY']}")
  end
end
