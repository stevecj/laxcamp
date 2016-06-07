class MessagesController < ApplicationController
  def create
    @message = Message.create do |m|
      m.communicator = communicator
      m.content = creation_params[:content]
    end
    redirect_to venue_path
  end

  private

  def communicator
    Communicator.where(handle: session[:handle]).first
  end

  def creation_params
    params.require(:message).permit(:content)
  end
end
