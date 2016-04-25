class LeagueController < ApplicationController

  def create
    @client = Lol::Client.new "#{ENV['LOL_KEY']}", {region: "euw"}
  end
end
