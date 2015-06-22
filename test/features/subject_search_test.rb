require "test_helper"

feature "SubjectSearch" do
  def setup
    @user = user_object('memarin@me.com', 'mem10249')
    @subject = subjects(:two)
  end

  test 'successfully search subject using subject code' do
    log_in_as(@user)
    visit subjects_path
    fill_in 'search', with: @subject.subject_code
    click_button 'search'
    assert page.has_content?('View')
    assert page.has_content?(@subject.subject_code)
    assert page.has_content?(@subject.subject_name)
    click_link 'View'
    assert page.has_content?(@subject.subject_code)
    assert page.has_content?(@subject.subject_name)
  end

  test 'unsuccessful subject search using subject code' do
    log_in_as(@user)
    visit subjects_path
    fill_in 'search', with: 'H1'
    click_button 'search'
    assert_not page.has_content?('View')
  end
end
