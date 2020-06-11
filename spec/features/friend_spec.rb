require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before :each do
    @user = User.create(name: 'User', email: 'user@mail.com', password: '1234567')
    @user = User.create(name: 'Tony', email: 'tony@mail.com', password: '1234567')
  end

  it 'Should see list of users to add as frineds' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'LOG IN'
    click_on 'FIND FRIENDS'
    expect(page).to have_content('Tony')
  end

  it 'Should be able to add a new friend' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'LOG IN'
    click_on 'FIND FRIENDS'
    click_on 'Invite to friendship'
    expect(page).to have_content('Pending')
  end

  it 'Should be able to accept a request' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'LOG IN'
    click_on 'FIND FRIENDS'
    click_on 'Invite to friendship'
    click_on 'SIGN OUT'
    fill_in 'session[email]', with: 'tony@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'LOG IN'
    click_on 'notify'
    click_on 'Accept'
    expect(page).to have_content('No Pending Requests')
  end

  it 'Should be able to reject a request' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'LOG IN'
    click_on 'FIND FRIENDS'
    click_on 'Invite to friendship'
    click_on 'SIGN OUT'
    fill_in 'session[email]', with: 'tony@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'LOG IN'
    click_on 'notify'
    click_on 'Reject'
    expect(page).to have_content('No Pending Requests')
  end
end