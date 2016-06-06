require 'rails_helper'

RSpec.describe "venues/show.html.erb", type: :view do
  it "renders the signed-in communicator's handle" do
    session[:handle] = 'my-handle'

    render

    expect( rendered ).to match(/\bmy-handle\b/)
  end
end
