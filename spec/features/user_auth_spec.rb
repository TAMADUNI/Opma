require 'rails_helper'

describe 'User authentication' do
  scenario 'User can sign in with valid email and password' do
    user = create(:user, email: 'test@example.com', password: '123')
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'User cannot sign in with invalid password' do
    user = create(:user, email: 'test@example.com', password: '123')
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: '1234'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'User cannot sign in with invalid email' do
    user = create(:user, email: 'text@example.com', password: '123')
    visit new_user_session_path
    fill_in 'Email', with: 'jumaa@juma.com'
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end
end
