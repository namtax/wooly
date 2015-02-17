class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.new(params[:campaign])
    fourohfour unless @campaign.exists?
  end
end
