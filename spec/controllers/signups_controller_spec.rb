require 'rails_helper'

RSpec.describe SignupsController, type: :controller do

  describe "POST #create" do
    let(:communicator_data) {
      { handle: 'my.handle', full_name: 'Myself' }
    }

    it "creates a new communicator" do
      post :create, signup: communicator_data
      expect(
        Communicator.where(communicator_data).first
      ).not_to be_nil
    end

    it "redirects to venue when successful" do
      post :create, signup: communicator_data
      expect(response).to redirect_to(venue_path)
    end
  end

end
