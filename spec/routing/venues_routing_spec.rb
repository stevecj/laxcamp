require "rails_helper"

RSpec.describe VenuesController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/venue").to route_to("venues#show")
    end

  end
end
