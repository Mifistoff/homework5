require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    it 'assigns @event' do
      event = Event.create
      get :index
      expect(assigns(:events)).to eq([event])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'should show event' do
      @event = Event.create
      get :show, params: { id: @event.to_param, template: 'event/show' }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    context 'if user is not admin' do
      it 'new event' do
        get :new, params: { template: 'event/new' }
        expect(response).to have_http_status(:found) # 302
        expect(response).to redirect_to(events_path)
      end
    end
    context 'if user is admin' do
      it 'new event' do
        get :new, params: { template: 'event/new' }
        expect(response).to have_http_status(:found) # 302
      end
    end
  end

  describe 'GET #edit' do
    context 'if user is not admin' do
      it 'edit event' do
        @event = Event.create
        allow_any_instance_of(Event).to receive(:save).and_return(false)
        get :edit, params: { id: @event.to_param, template: 'event/edit' }
        expect(response).to have_http_status(:found) # 302
        expect(response).to redirect_to(events_path)
      end
    end
    context 'if user is admin' do
      it 'edit event' do
        @event = Event.create
        get :edit, params: { id: @event.to_param, template: 'event/edit' }
        expect(response).to have_http_status(:found) # 302
      end
    end
  end

  describe 'POST #create' do
    context 'if user is not admin' do
      it 'create event' do
        params = {name: nil, date: false, place: nil, description: nil}
        allow_any_instance_of(Event).to receive(:save).and_return(false)
        post :create, params: { event: params }
        expect(response).to have_http_status(:ok) # 200
        expect(response).to render_template 'events/new'
      end
    end
    context 'if user is admin' do
      it 'create event' do
        params = {name: 'new event', date: '2017-06-25', place: 'somewhere', description: 'some description'}
        @event = Event.new(params)
        post :create, params: { event: params }
        expect(response).to have_http_status(:found) # 302
      end
    end
  end

  describe 'PUT #update' do
    context 'if user is not admin' do
      it 'update event' do
        params = { name: 'new event', date: '2017-06-25', place: 'somewhere', description: 'some description'}
        @event = Event.create(params)
        params[:id] = @event.id
        allow_any_instance_of(Event).to receive(:save).and_return(false)
        put :update, params: { id: @event.id, event: params }
        expect(response).to have_http_status(:ok) # 200
        expect(response).to render_template 'events/edit'
      end
    end
    context 'if user is admin' do
      it 'update event' do
        params = { name: 'new event', date: '2017-06-25', place: 'somewhere', description: 'some description'}
        @event = Event.create(params)
        params[:id] = @event.id
        put :update, params: { id: @event.id, event: params }
        expect(response).to have_http_status(:found) # 302
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'if user is admin' do
      it 'destroy event' do
        session[:user_id] = 1
        User.create id: 1, role: 'admin'
        @event = Event.create
        put :destroy, params: { id: @event.id }
        expect(response).to have_http_status(:found) # 302
        expect(response).to redirect_to events_path
      end
    end
  end
end
