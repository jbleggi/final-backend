class Api::V1::SubscriptionsController < ApplicationController
  def index
    render json: Subscription.all
  end
  
end