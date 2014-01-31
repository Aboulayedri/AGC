require "spec_helper"

describe AramisEntitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/aramis_entities").should route_to("aramis_entities#index")
    end

    it "routes to #new" do
      get("/aramis_entities/new").should route_to("aramis_entities#new")
    end

    it "routes to #show" do
      get("/aramis_entities/1").should route_to("aramis_entities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/aramis_entities/1/edit").should route_to("aramis_entities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/aramis_entities").should route_to("aramis_entities#create")
    end

    it "routes to #update" do
      put("/aramis_entities/1").should route_to("aramis_entities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/aramis_entities/1").should route_to("aramis_entities#destroy", :id => "1")
    end

  end
end
