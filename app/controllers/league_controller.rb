class LeagueController < ApplicationController

  def index
    @gang = CrowGang.new
    @gang.call
    @gang.wins
    @gang.losses

    @seven = Seven.new
    @seven.call
    @seven.wins
    @seven.losses
  end
# get rails to grab query from searchbar? use param value to create db entry
#with wins, losses and ids, and make specific api call
#link to page with summoners details on

  def create
    @summoner = Summoner.new
    @summoner.search_query
  end
end
