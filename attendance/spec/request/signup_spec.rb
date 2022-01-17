require 'rails_helper'

describe 'User signup', type: :request do
  let(:email) { build(:email) }
  let(:password) { build(:password) }

  before do
    visit new_registration_path
  end

  scenario 'With valid data' do
    fill_in 'user_email', with: email
    fill_in 'password', with: password
    click_button 'Register'
    expect(page).to have_content('You have registered successfully.')
  end
end
