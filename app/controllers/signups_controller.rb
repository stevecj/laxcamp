class SignupsController < ApplicationController

  def create
    @communicator = Communicator.create( creation_params )

    if @communicator.errors.any?
      render 'home/show'
      return
    end

    reset_session
    session[:handle] = @communicator.handle

    redirect_to venue_path
  end

  private

  def creation_params
    params.require(:signup).permit(:handle, :full_name)
  end
end
