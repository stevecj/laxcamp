require "rails_helper"

RSpec.describe HomeController, type: :routing do
  describe "routing" do

    it "routes root to #show" do
      expect(:get => "/").to route_to("home#show")
    end

  end
end

