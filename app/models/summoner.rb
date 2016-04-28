class Summoner < ActiveRecord::Base

  def create
    @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/82746988/summary?season=SEASON2016&api_key=#{ENV['LOL_KEY']}")
    #create database entry of call, taking id, wins, losses
    #replace hard code summoner with variable, summoner by id
  end
end
