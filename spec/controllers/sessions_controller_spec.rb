require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    context 'successful login' do
      it 'login' do
        user = User.create
        params = { login: user.login, password: user.password }
        post :create, params: { session: params }
        expect(response).to have_http_status(:found) # 302
        expect(response).to redirect_to root_url
      end
    end
    context 'login failed' do
      it 'login' do
        params = { login: 'user', password: '12345' }
        post :create, params: { session: params }
        expect(session[:user_id]).to eq(nil)
        expect(response).to have_http_status(:found) # 302
        expect(response).to redirect_to root_url
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'log user out' do
      it 'logout' do
        user = User.create
        session[:user_id] = user.id
        get :destroy
        expect(session[:user_id]).to eq(nil)
        expect(response).to have_http_status(:found) # 302
        expect(response).to redirect_to root_url
      end
    end
  end
end
