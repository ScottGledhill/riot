class LeagueController < ApplicationController

  def create
    @client = RestClient.get "https://euw.api.pvp.net/api/lol/euw/v1.2/champion?api_key=#{ENV['LOL_KEY']}""
  end
end
