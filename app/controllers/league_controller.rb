class LeagueController < ApplicationController

  def index
    @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/81323101/summary?season=SEASON2016&api_key=#{ENV['LOL_KEY']}")
    @object = JSON.parse(@client)["playerStatSummaries"][2]["wins"]
  end
end
