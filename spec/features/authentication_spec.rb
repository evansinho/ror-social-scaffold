require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(name: 'user', email: 'user@mail.com', password: 'password', password_confirmation: 'password')
  end

  it 'Should Signup' do
    visit new_user_registration_path
    fill_in 'user[email]', with: 'newuser@mail.com'
    fill_in 'user[name]', with: 'newuser'
    fill_in 'user[password]', with: 'passwordd'
    fill_in 'user[password_confirmation]', with: 'passwordd'
    click_button 'Sign Up'
    expect(page).to have_content('STAY IN TOUCH')
    expect(page).to have_content('TIMELINE')
    expect(page).to have_content('SIGN OUT')
  end

  it 'Should Signin' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: 'password'
    click_button 'LOG IN'
    expect(page).to have_content('STAY IN TOUCH')
    expect(page).to have_content('TIMELINE')
    expect(page).to have_content('SIGN OUT')
  end

  it 'Should Signout' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: 'password'
    click_button 'LOG IN'
    expect(page).to have_content('STAY IN TOUCH')
    expect(page).to have_content('TIMELINE')
    expect(page).to have_content('SIGN OUT')
    click_button 'SIGN OUT'
    expect(page).to have_content('STAY IN TOUCH')
    expect(page).to have_content('TIMELINE')
    expect(page).to have_content('SIGN IN')
  end
end
