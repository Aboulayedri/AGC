require "spec_helper"

describe ProjectCodesController do
  describe "routing" do

    it "routes to #index" do
      get("/project_codes").should route_to("project_codes#index")
    end

    it "routes to #new" do
      get("/project_codes/new").should route_to("project_codes#new")
    end

    it "routes to #show" do
      get("/project_codes/1").should route_to("project_codes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/project_codes/1/edit").should route_to("project_codes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/project_codes").should route_to("project_codes#create")
    end

    it "routes to #update" do
      put("/project_codes/1").should route_to("project_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/project_codes/1").should route_to("project_codes#destroy", :id => "1")
    end

  end
end
