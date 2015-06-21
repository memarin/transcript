require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save course without course code' do
    course = Course.new
    course.course_name = 'Test X'
    assert_not course.save
  end

  test 'should not save without course name' do
    course = Course.new
    course.course_code = 'TX'
    assert_not course.save
  end

  test 'should save with both course name and code' do
    course = Course.new
    course.course_code = 'TX'
    course.course_name = 'Testing X'
    assert course.save
  end

  test 'should not save duplicate course code' do
    course1 = Course.new
    course1.course_code = 'TX'
    course1.course_name = 'Testing X'
    assert course1.save

    course2 = Course.new
    course2.course_code = 'TX'
    course2.course_name = 'Test X'
    assert_not course2.save
  end

  test 'should edit course successfully' do
    course = Course.first
    course.course_code = 'NT'
    course.course_name = 'New Test'
    assert course.save
  end

  test 'should edit course unsuccessfully' do
    course = Course.first
    course.course_code = ''
    assert_not course.save
  end
end
