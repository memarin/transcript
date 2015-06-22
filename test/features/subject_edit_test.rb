require "test_helper"

feature "SubjectEdit" do
  def setup
    @user    = user_object('memarin@me.com', 'mem10249')
    @subject = subjects(:two)
  end

  test 'edit subject sucessfully' do
    log_in_as(@user)
    visit edit_subject_path(@subject)
    fill_in 'Subject name', with: 'New subject code'
    fill_in 'Subject code', with: 'New subject name'
    fill_in 'Units', with: 1
    click_button 'Update Subject'
    assert page.has_content?('Subject updated')
    @subject.reload
    visit subject_path(@subject)
    assert page.has_content?('New subject code')
    assert page.has_content?('New subject name')
  end

  test 'unsuccessful subject edit without subject name' do
    log_in_as(@user)
    visit edit_subject_path(@subject)
    fill_in 'Subject name', with: ''
    fill_in 'Subject code', with: 'New subject code'
    fill_in 'Units', with: 1
    click_button 'Update Subject'
    assert page.has_content?("can't be blank")
  end

  test 'unsuccessful subject edit without subject code' do
    log_in_as(@user)
    visit edit_subject_path(@subject)
    fill_in 'Subject name', with: 'New subject name'
    fill_in 'Subject code', with: ''
    fill_in 'Units', with: 1
    click_button 'Update Subject'
    assert page.has_content?("can't be blank")
  end

  test 'unsuccessful subject edit without both subject code, name and units' do
    log_in_as(@user)
    visit edit_subject_path(@subject)
    fill_in 'Subject name', with: ''
    fill_in 'Subject code', with: ''
    fill_in 'Units', with: ''
    click_button 'Update Subject'
    assert page.has_content?("can't be blank", count: 3)
  end
end
