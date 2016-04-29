class LeagueController < ApplicationController

  def new
    @summoner = Summoner.new
  end

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
    Summoner.new.create
    @params.search_query
  end

  # private
  #
  # def user_params
  #   params.require(:params).permit(:id, :wins, :losses)
  # end
end
