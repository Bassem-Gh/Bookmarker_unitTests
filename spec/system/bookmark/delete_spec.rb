# spec/system/bookmark/update_spec.rb

require 'rails_helper'

RSpec.describe 'delete bookmark', type: :system do
  # this will create a 'bookmark' method, before each scenario is ran
  let!(:bookmark) { Bookmark.create(url: 'https://rubyyagi.com', title: 'Ruby Yagi') }

  scenario 'record deleted successfully' do
    visit bookmarks_path

    # hit OK to confirm deleting process
    accept_confirm do
      # click the link that has the text 'Edit'
      click_link 'Destroy'
    end
    # The page should show error message 'Title can't be blank'
    expect(page).to have_content('Bookmark was successfully destroyed')
  end

  scenario 'cancel record deleting' do
    visit bookmarks_path

    # hit OK to confirm deleting processus
    dismiss_confirm do
      # click the link that has the text 'Edit'
      click_link 'Destroy'
    end
    # The bookmark title should be unchanged
    expect(bookmark.reload.title).to eq('Ruby Yagi')
  end
end
