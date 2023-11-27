# spec/requests/blogs/list_blog_spec.rb

require 'rails_helper'

describe 'GET /blogs' do
  before do
    @blogs = Blog.create([
      {title: "First Blog", body: "This is the first blog"},
      {title: "Second Blog", body: "This is the second blog", subheader: "A sequel to the first one"},
      {title: "Third Blog", body: "This is the third blog"},
      {title: "Fourth Blog", body: "This is the fourth blog"},
    ])
  end

  scenario 'display all blogs' do
    get '/blogs'

    expect(response).to have_http_status(:success)

    json = JSON.parse(response.body)
    
    # check the value of the returned response hash
    expect(json.count).to eq(@blogs.count)
  end

  scenario 'display specific blog' do
    get "/blogs/#{@blogs.first.id}"

    expect(response).to have_http_status(:success)

    json = JSON.parse(response.body)
    expect(json["title"]).to eq(@blogs.first.title)
  end

  scenario 'display invalid blog id' do
    get "/blogs/#{@blogs.last.id + 1}"

    expect(response).to have_http_status(:success)

    json = JSON.parse(response.body)
    expect(json).to eq(nil)
  end
end