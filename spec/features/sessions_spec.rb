require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  before do
    Communicator.create! do |c|
      c.handle = 'bacon'
      c.full_name = 'Thin Sliced Bacon'
    end
  end

  scenario 'Communicator signs in and out' do
    visit '/'

    fill_in "com_session[handle]", with: 'bacon'
    find(:css, "#com_session_submit").click

    expect(page).to have_css("[data-section-type='venue']")
    within :css, '.handle' do
      expect(page).to have_content("bacon")
    end

    find(:css, "#sign_out_action").click

    expect(page).to have_css("[data-section-type='new_session_form']")
  end

end
