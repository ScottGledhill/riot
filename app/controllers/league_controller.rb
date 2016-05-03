class LeagueController < ApplicationController

  def index
    @params = params[:q]
    @params_adjusted = @params.to_sym
    @name = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/#{@params_adjusted}?api_key=#{ENV['LOL_KEY']}")
    @summoner = JSON.parse(@name)[@params]["id"]

    @gang = CrowGang.new
    @gang.call
    @gang.wins
    @gang.losses

    @seven = Seven.new
    @seven.call
    @seven.wins
    @seven.losses
  end

  def retrieve_summoner_name
  end

  def call
    # @client = RestClient.get("https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/82746988/summary?season=SEASON2016&api_key=#{ENV['LOL_KEY']}")
  end
end
