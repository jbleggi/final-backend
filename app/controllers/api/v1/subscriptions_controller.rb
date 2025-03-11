class Api::V1::SubscriptionsController < ApplicationController
  def index
    subscriptions = Subscription.all
    # render json: SubscriptionSerializer.new(subscriptions)
    render json: { subscriptions: SubscriptionSerializer.new(subscriptions).serializable_hash[:data].map { |subscription| subscription[:attributes] } }

  end
  
  def show
    render json: SubscriptionSerializer.new(Subscription.find(params[:id]))
  end

  def update
    subscription = Subscription.find(params[:id])

    subscription.update(updated_status_params)

    render json: SubscriptionSerializer.new(subscription)
  end

  private

  def updated_status_params
    params.require(:subscription).permit(:status) 
  end
end