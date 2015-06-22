require "test_helper"

describe Subject do
  test 'should not create without subject code' do
    subject = Subject.new
    subject.subject_code = ''
    subject.subject_name = 'test'
    subject.units = 3
    assert_not subject.save
  end

  test 'should not create without subject name' do
    subject = Subject.new
    subject.subject_code = 'T1'
    subject.subject_name = ''
    subject.units = 3
    assert_not subject.save
 end

  test 'should not create without units' do
    subject = Subject.new
    subject.subject_code = 'T1'
    subject.subject_name = 'test'
    subject.units = nil
    assert_not subject.save
  end
end
