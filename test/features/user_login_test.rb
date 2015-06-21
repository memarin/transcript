require "test_helper"

feature "UserLogin" do
  test 'successful user login' do
    visit new_user_session_path
    fill_in 'Email', with: 'memarin@me.com'
    fill_in 'Password', with: 'mem10249'
    click_button 'Log in'
    assert page.has_content?('Signed in successfully.')
  end

  test 'unsuccessful user login' do
    visit new_user_session_path
    fill_in 'Email', with: 'hello'
    fill_in 'Password', with: 'hi'
    click_button 'Log in'
    assert_not page.has_content?('Signed in successfully.')
  end

  test 'unsuccessful login with blank' do
    visit new_user_session_path
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_button 'Log in'
    assert_not page.has_content?('Signed in successfully.')
  end
end
