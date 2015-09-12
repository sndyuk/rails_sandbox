require 'rails_helper'

describe BlogsController do
  describe 'GET #index' do
    it "@blogsに全てのBlogが入っていること" do
      get :index
      expect(assigns(:blogs)).to be_empty

      post :create, blog: {title: 'a'}
      get :index
      expect(assigns(:blogs).size).to eq(1)
      expect(assigns(:blogs)[0].title).to eq('a')
      post :create, blog: {title: 'b'}
      get :index
      expect(assigns(:blogs).size).to eq(2)
      expect(assigns(:blogs)[0].title).to eq('b')
      expect(assigns(:blogs)[1].title).to eq('a')
    end
  end

  describe 'POST #create' do
    it "新規作成後に@blogのshowに遷移すること" do
      post :create, blog: {title: 'a'}
      expect(response).to redirect_to(blog_path(assigns(:blog)))
    end
  end
end
