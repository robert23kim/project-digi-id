require 'rails_helper'
# references 
# https://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html

if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

describe UsersController do

  describe "GET index" do
    it "assigns @users" do
      user = FactoryGirl.create(:user)
      get :index
      expect(assigns(:users)).to eq([user])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = FactoryGirl.create(:user)
      get :show, id: user
      assigns(:user).should eq(user)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:user)
      response.should render_template :show
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new user in the database" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User,:count).by(1)
      end
      it "redirects to the home page" do
        post :create, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to users_path
      end
    end
  end

  describe "POST #open_case" do
    context "with valid attributes" do
      it "saves the new movie in the database" do
        expect{
          post :create, movie: FactoryGirl.attributes_for(:movie)
        }.to change(Movie,:count).by(1)
      end
      it "redirects to the home page" do
        post :create, movie: FactoryGirl.attributes_for(:movie)
        response.should redirect_to movies_path
      end
    end
  end

  describe "POST #add_asset" do
    context "with valid attributes" do
      it "saves the new movie in the database" do
        expect{
          post :create, movie: FactoryGirl.attributes_for(:movie)
        }.to change(Movie,:count).by(1)
      end
      it "redirects to the home page" do
        post :create, movie: FactoryGirl.attributes_for(:movie)
        response.should redirect_to movies_path
      end
    end
  end
end