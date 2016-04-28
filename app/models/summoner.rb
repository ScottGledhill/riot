class Summoner < ActiveRecord::Base

  def create
    @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/#{@summoner_id}/summary?season=SEASON2016&api_key=#{ENV['LOL_KEY']}")
  end

  def search_query
    @summoner_id = Summoner.new(params[:param1])
  end
end
