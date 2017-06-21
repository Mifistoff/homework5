require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  describe 'POST #create' do
    context 'if user is logged in' do
      it 'subscribe' do
        user = User.create
        session[:user_id] = user.id
        @event = Event.create
        params = { user_id: user.id, event_id: @event.id }
        post :create, params: { event_id: @event.id, subscription: params }
        expect(response).to have_http_status(:found) # 302
        expect(response).to redirect_to(event_path(@event))
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'if user is logged in' do
      it 'destroy subscriptions' do
        user = User.create
        session[:user_id] = user.id
        @event = Event.create
        @subscription = Subscription.create(user_id: user.id, event_id: @event.id)

        put :destroy, params: { id: @subscription.id, user_id: user.id, event_id: @event.id }
        expect(response).to have_http_status(:found) # 302
        expect(response).to redirect_to(event_path(@event))
      end
    end
  end
end
