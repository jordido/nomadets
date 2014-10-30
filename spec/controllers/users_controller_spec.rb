require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  user = FactoryGirl.create(:user)
  
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, id: user.id
      expect(response).to be_success
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, id: user.id
      expect(response).to be_success
    end
  end

end
