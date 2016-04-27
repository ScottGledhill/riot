class Freeze < ActiveRecord::Base

  def call
    p @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/82746988/summary?season=SEASON2016&api_key=#{ENV['LOL_KEY']}")
  end

  def losses
    @losses = JSON.parse(@client)["playerStatSummaries"][8]["losses"]
  end

  def wins
    @wins = JSON.parse(@client)["playerStatSummaries"][8]["wins"]
  end
end
