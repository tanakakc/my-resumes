require "rails_helper"

RSpec.describe WorkHistoriesController, type: :routing do
  describe "routing" do

    it "doesn't routes to #index" do
      expect(:get => "/work_histories").not_to be_routable
    end

    it "routes to #new" do
      expect(:get => "/work_histories/new").to route_to("work_histories#new")
    end

    it "doesn't routes to #show" do
      expect(:get => "/work_histories/1").not_to be_routable
    end

    it "routes to #edit" do
      expect(:get => "/work_histories/1/edit").to route_to("work_histories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/work_histories").to route_to("work_histories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/work_histories/1").to route_to("work_histories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/work_histories/1").to route_to("work_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/work_histories/1").to route_to("work_histories#destroy", :id => "1")
    end

  end
end
