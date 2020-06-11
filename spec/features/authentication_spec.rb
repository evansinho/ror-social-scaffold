require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(name: 'User', email: 'user@mail.com', password: 'password', password_confirmation: 'password')
  end

  it 'Should Signup' do
    visit root_path
    fill_in 'user[email]', with: 'newUser@mail.com'
    fill_in 'user[name]', with: 'User'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'SIGN UP'
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
