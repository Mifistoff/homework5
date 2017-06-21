class SubscriptionsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.subscriptions.create(
      user_id: user_info[:id]
    )
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @subscription = @event.subscriptions.find(params[:id])
    @subscription.destroy
    redirect_to event_path(@event)
  end
end
