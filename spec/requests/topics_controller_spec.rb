require 'rails_helper'

RSpec.describe TopicsController , type: :controller do

  let(:topic) {Topic.create(topic_name: "Home")}

  describe 'GET Index' do
    context 'Vaild' do
      it 'return index page' do
        topic
        get :index
        expect(assigns(:topics).count).to eq 1
        expect(assigns(:topics).first).to eq topic
        expect(response).to render_template 'index'
        expect(response).to have_http_status 200
      end
    end
    context 'Not Valid' do
      it "should not valid" do
        topic
        get :index
        expect(assigns(:topics).count).not_to eq 0
        expect(response).not_to render_template 'home'
        expect(response).not_to have_http_status 404
      end
    end
  end

  describe 'GET new' do
    context 'Vaild' do
      it "return new page" do
        get :new
        expect(response).to render_template 'new'
        expect(response).to have_http_status 200
      end
    end
    context 'Not Vaild' do
      it "should not return new " do
        get :new
        expect(response).not_to render_template 'index'
        expect(response).not_to have_http_status 302
      end
    end
  end

  describe 'GET edit' do
    context 'Valid' do
      it 'should return edit' do
        topic
        get :edit , params:{id:topic.id}
        expect(response).to render_template 'edit'
        expect(response).to have_http_status 200
      end
    end
    context 'Not Vaild ' do
      it 'should not return edit ' do
        topic
        get :edit , params:{id:topic.id}
        expect(response).not_to render_template 'new'
        expect(response).not_to have_http_status 404
      end
    end
  end

  describe 'POST create' do
    context 'Vaild' do
      it "should create new data" do
        expect{post :create , params: {topic: {topic_name:"Home"}}}.to change(Topic,:count).by(1)
        expect(assigns(:topic).topic_name).to eq 'Home'
        expect(response).to redirect_to "/topics/#{assigns(:topic).id}"
        expect(response).to have_http_status 302
        expect(flash[:notice]).to eq "Topic was successfully created."
      end
    end
  end

  describe 'GET show' do
    context "Valid" do
      it "should show " do
        topic
        get :show , params: {id: topic.id}
        expect(response).to render_template 'show'
        expect(response).to have_http_status 200
      end
    end
  end

  describe 'PATCH update' do
    context 'Valid' do
      it "should update" do
        topic
        patch :update, params:{topic: {topic_name:'World'},id:topic.id}
        expect(topic.reload.topic_name).to eq 'World'
        expect(response).to redirect_to "/topics/#{assigns(:topic).id}"
        expect(response).to have_http_status 302
      end
    end
  end

  describe 'DELETE destroy' do
    context 'destroy the data' do
      it "should destroy the daya" do
        topic
        expect{delete :destroy, params:{id:topic.id}}.to change(Topic, :count).by(-1)
        expect(response).to redirect_to "/topics"
        expect(response).to have_http_status 302
      end
    end
  end

end