class VenuesController < ApplicationController
  def show
    @messages = Message.includes(:communicator).order(:created_at)
  end
end
