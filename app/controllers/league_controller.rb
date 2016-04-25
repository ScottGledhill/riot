class LeagueController < ApplicationController

  def create
    @client = Lol::Client.new "f9448b37-6deb-4972-b949-818de948e8a7", {region: "euw"}
  end
end
