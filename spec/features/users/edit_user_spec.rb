require 'rails_helper'
RSpec.describe 'editing user' do
  it 'displays prepopulated form' do
    user = create_user
    log_in user
    click_link 'Edit Profile'
    expect(page).to have_field('user[name]')
    expect(page).to have_field('user[email]')
  end
end