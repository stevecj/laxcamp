class SessionsController < ApplicationController
  def create
    @com_session = ComSession.new(creation_params)

    reset_session
    session[:handle] = @com_session.handle

    unless @com_session.valid?
      render 'home/show'
      return
    end

    puts 'b'
    redirect_to venue_path
  end

  def destroy
    reset_session
    cookies.delete :user_id
    redirect_to home_path
  end

  private

  def creation_params
    params.require(:com_session).permit(:handle)
  end
end
