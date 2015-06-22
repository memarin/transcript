require "test_helper"

feature "UserLogin" do
  def setup
    @valid_user   = user_object('memarin@me.com', 'mem10249')
    @invalid_user = user_object('hi', 'hello')
    @blank_user   = user_object('', '')
  end
  test 'successful user login' do
    log_in_as(@valid_user)
    assert page.has_content?('Signed in successfully.')
  end

  test 'unsuccessful user login' do
    log_in_as(@invalid_user)
    assert_not page.has_content?('Signed in successfully.')
  end

  test 'unsuccessful login with blank' do
    log_in_as(@blank_user)
    assert_not page.has_content?('Signed in successfully.')
  end
end
