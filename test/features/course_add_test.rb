require "test_helper"

feature "CourseAdd" do
  def setup
    @user = user_object('memarin@me.com', 'mem10249')
  end

  test 'successfully add course' do
    log_in_as(@user)
    visit new_course_path
    fill_in 'Couse Code'
  end
end
