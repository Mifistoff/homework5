require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    context 'if user is logged in' do
      it 'create comment' do
        user = User.create(login: 'user')
        session[:user_id] = user.id
        @event = Event.create
        params = { commenter: user.login, body: 'some body', event_id: @event.id }
        post :create, params: { event_id: @event.id, comment: params }
        expect(response).to have_http_status(:found) # 302
        expect(response).to redirect_to(event_path(@event))
      end
    end
  end
end
