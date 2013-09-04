require "spec_helper"

describe MusiciansController do
  describe "routing" do

    it "routes to #index" do
      get("/musicians").should route_to("musicians#index")
    end

    it "routes to #new" do
      get("/musicians/new").should route_to("musicians#new")
    end

    it "routes to #show" do
      get("/musicians/1").should route_to("musicians#show", :id => "1")
    end

    it "routes to #edit" do
      get("/musicians/1/edit").should route_to("musicians#edit", :id => "1")
    end

    it "routes to #create" do
      post("/musicians").should route_to("musicians#create")
    end

    it "routes to #update" do
      put("/musicians/1").should route_to("musicians#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/musicians/1").should route_to("musicians#destroy", :id => "1")
    end

  end
end
