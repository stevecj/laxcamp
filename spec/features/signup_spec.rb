require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario 'Communicator signs up' do
    visit '/'

    fill_in "signup[handle]",    with: 'my.handle'
    fill_in "signup[full_name]", with: 'My Name'
    find(:css, "#signup_submit").click

    expect(page).to have_css("[data-section-type='venue']")
    within '.handle' do
      expect(page).to have_content("my.handle")
    end
  end

end
