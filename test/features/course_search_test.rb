require "test_helper"

feature "CourseSearch" do
  def setup
    @user = user_object('memarin@me.com', 'mem10249')
    @course = courses(:t1)
  end

  test 'successfully search using course code' do
    log_in_as(@user)
    visit courses_path
    fill_in 'search', with: @course.course_code
    click_button 'search'
    assert page.has_content?('Testing1')
    assert page.has_content?('View')
    assert page.has_content?(@course.course_code)
    assert page.has_content?(@course.course_name)
    click_link 'View'
    assert page.has_content?(@course.course_code)
    assert page.has_content?(@course.course_name)
  end

  test 'unsuccessful search using course code' do
    log_in_as(@user)
    visit courses_path
    fill_in 'search', with: 'Y1'
    click_button 'search'
    assert_not page.has_content?('View')
  end
end
