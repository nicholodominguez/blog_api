# spec/requests/blogs/search_blog_spec.rb

require 'rails_helper'

describe 'GET /blogs/search' do
  before do
    @blogs = Blog.create([
      {title: "First Blog", body: "This is the first blog"},
      {title: "Second Blog", body: "This is the second blog", subheader: "A sequel to the first one"},
      {title: "Third Blog", body: "This is the third blog"},
      {title: "Fourth Blog", body: "This is the fourth blog"},
    ])
  end

  scenario 'search for blogs containing "first"' do
    get "/blogs/search", params: { query: "first" }

    expect(response).to have_http_status(:success)

    json = JSON.parse(response.body)
    
    # check the value of the returned response hash
    expect(json.count).to eq(2)
  end

  scenario 'search for blogs containing "none"' do
    get "/blogs/search", params: { query: "none" }

    expect(response).to have_http_status(:success)

    json = JSON.parse(response.body)
    
    # check the value of the returned response hash
    expect(json.count).to eq(0)
  end
end