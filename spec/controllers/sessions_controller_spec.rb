require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #create" do
    before do
      Communicator.create! communicator_info
    end

    let(:communicator_info) {
      { handle: 'some-handle', full_name: 'Some Name' }
    }

    it "signs a communicator in" do
      get :create, com_session: { handle: communicator_info[:handle] }
      expect( session[:handle] ).to eq( 'some-handle' )
    end

    it "redirects to venue on success" do
      get :create, com_session: { handle: communicator_info[:handle] }
      expect( response ).to redirect_to( venue_path )
    end
  end

  describe "GET #destroy" do
    before do
      session[:handle] = 'something'
    end

    it "signs a communicator out" do
      get :destroy
      expect( session[:handle] ).to be_nil
    end

    it "redirects to home on success" do
      get :destroy
      expect( response ).to redirect_to( home_path )
    end
  end

end
