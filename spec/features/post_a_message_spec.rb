require 'rails_helper'

RSpec.feature "Post a Message", type: :feature do
  before do
    Communicator.create! do |c|
      c.handle = communicator_handle
      c.full_name = 'Thin Sliced Bacon'
    end
  end

  let(:communicator_handle) { 'bacon' }
  let(:lorem_ipsum) {
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, " \
    "sed do eiusmod tempor incididunt ut labore et dolore " \
    "magna aliqua. Ut enim ad minim veniam, quis nostrud " \
    "exercitation ullamco laboris nisi ut aliquip ex ea " \
    "commodo consequat. Duis aute irure dolor in reprehenderit " \
    "in voluptate velit esse cillum dolore eu fugiat nulla " \
    "pariatur. Excepteur sint occaecat cupidatat non proident, " \
    "sunt in culpa qui officia deserunt mollit anim id est " \
    "laborum."
  }

  scenario "Communicator posts a message" do
    visit '/'

    fill_in "com_session[handle]", with: communicator_handle
    find(:css, "#com_session_submit").click

    fill_in "message[content]", with: lorem_ipsum
    find(:css, "#message_submit").click

    within :css, "[data-author=#{communicator_handle}]" do
      expect( page ).to have_content( communicator_handle )
      expect( page ).to have_content( lorem_ipsum )
    end
  end
end
