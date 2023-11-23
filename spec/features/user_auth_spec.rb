require 'rails_helper'

describe 'User authentication' do

  scenario 'User signs up and confirms email' do
    visit new_user_registration_path
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: '123'
    fill_in 'Password confirmation', with: '123'
    click_on 'Sign up'
    expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')

    user = User.find_by(email: 'test@example.com')

    confirmation_url = find_confirmation_url(user)

    visit confirmation_url
    expect(page).to have_content('Your email address has been successfully confirmed.')
  end
  scenario 'User can sign in with valid email and password' do
    user = create(:user, email: 'test@example.com', password: '123', confirmed_at: Time.current)
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

  def find_confirmation_url(user)
    mail = ActionMailer::Base.deliveries.last
    body = mail.body.encoded
    return unless mail.subject.include?('Confirmation instructions')

    body = mail.body.encoded

    body.match(%r{http://.*confirmation\?confirmation_token=\w+})[0]
  end
end
