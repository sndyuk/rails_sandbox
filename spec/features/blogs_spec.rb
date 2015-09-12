require 'rails_helper'

feature 'Blog管理' do
    scenario 'Blogの新規作成時にtitleを入力しなかった場合にエラーが表示されること' do
      visit blogs_path
      click_link 'New Blog'
      click_button 'Save'
      expect(find('#error_explanation')).to have_text('1 error prohibited this blog from being saved:')
    end
    scenario 'Blogの新規作成時にtitleを入力した場合はデータが保存され閲覧画面に遷移すること' do
      visit blogs_path
      click_link 'New Blog'
      fill_in 'Title', with: 'title'
      expect {
          click_button 'Save'
      }.to change(Blog, :count).by(1)
      expect(current_path).to match("\\A" + Regexp.escape(blog_path('')) + "[0-9]+\\z")
      expect(page).to have_content 'Blog was successfully created.'
    end
end
