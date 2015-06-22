require "test_helper"

feature "CourseEdit" do
  def setup
    @user = user_object('memarin@me.com', 'mem10249')
    @course = courses(:t1)
  end

  test 'successful course edit' do
    log_in_as(@user)
    visit edit_course_path(@course)
    fill_in 'Course code', with: 'ZYX'
    fill_in 'Course name', with: 'Hi Hello'
    click_button 'Update Course'
    assert page.has_content?('Course updated')

    visit course_path(@course)
    assert page.has_content?('ZYX')
    assert page.has_content?('Hi Hello')
  end

  test 'unsuccessful course edit without course code' do
    log_in_as(@user)
    visit edit_course_path(@course)
    fill_in 'Course code', with: ''
    click_button 'Update Course'
    assert page.has_content?("can't be blank")
  end

  test 'unsuccessful course edit without course name' do
    log_in_as(@user)
    visit edit_course_path(@course)
    fill_in 'Course name', with: ''
    click_button 'Update Course'
    assert page.has_content?("can't be blank")
  end

  test 'unsuccessful course edit without course name and code' do
    log_in_as(@user)
    visit edit_course_path(@course)
    fill_in 'Course name', with: ''
    fill_in 'Course code', with: ''
    click_button 'Update Course'
    assert page.has_content?("can't be blank", count: 2)
  end
end
