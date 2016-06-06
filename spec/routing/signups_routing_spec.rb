require "rails_helper"

RSpec.describe SignupsController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/signups").to route_to("signups#create")
    end

  end
end
