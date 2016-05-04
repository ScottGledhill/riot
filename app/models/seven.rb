class Seven < ActiveRecord::Base

  def call
    @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/82746988/summary?season=SEASON2016&api_key=#{ENV['LOL_KEY']}")
  end

  def losses
    @losses = JSON.parse(@client)["playerStatSummaries"][7]["losses"]
  end

  def wins
    @wins = JSON.parse(@client)["playerStatSummaries"][8]["wins"]
  end

  def use_model
    call
    wins
    losses
  end
end
