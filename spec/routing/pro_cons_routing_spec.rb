require "rails_helper"

RSpec.describe ProConsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pro_cons").to route_to("pro_cons#index")
    end

    it "routes to #new" do
      expect(:get => "/pro_cons/new").to route_to("pro_cons#new")
    end

    it "routes to #show" do
      expect(:get => "/pro_cons/1").to route_to("pro_cons#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pro_cons/1/edit").to route_to("pro_cons#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pro_cons").to route_to("pro_cons#create")
    end

    it "routes to #update" do
      expect(:put => "/pro_cons/1").to route_to("pro_cons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pro_cons/1").to route_to("pro_cons#destroy", :id => "1")
    end

  end
end
