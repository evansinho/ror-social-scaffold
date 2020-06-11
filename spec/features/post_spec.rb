require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before :each do
    @user = User.create(name: 'User', email: 'user@mail.com', password: '1234567')
    @post = Post.create(content: 'An awesome post', user_id: @user.id)
  end

  it 'Should create a post' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'LOG IN'
    fill_in 'post[content]', with: 'This is a post content'
    click_on 'SAVE'
    expect(page).to have_content('This is a post content')
    expect(page).to have_content('COMMENT')
    expect(page).to have_content('LIKE')
  end
end