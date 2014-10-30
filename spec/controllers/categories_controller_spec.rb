require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do

  category = FactoryGirl.create(:category)

  describe "GET index" do
    it "returns http success" do
      get :index, :id => category.id
      expect(response).to be_success
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, :id => category.id
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
      get :show, :id => category.id
      expect(response).to be_success
    end
  end

  describe "DELETE destroy" do
    it "returns http success" do
      delete :destroy, :id => category.id
      expect(response).to redirect_to categories_url
    end
  end

end
