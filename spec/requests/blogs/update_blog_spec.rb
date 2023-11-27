# spec/requests/blogs/update_blog_spec.rb

require 'rails_helper'

describe 'PATCH /blogs' do

  let(:title) { 'Rspec test blog' }
  let(:body) { 'This is to test the update blog request' }
  
  let(:new_title) { 'Updated title' }
  let(:new_body) { "This content has been updated" }

  before do
    @blog = Blog.create(title: title, body: body)
  end
  
  scenario 'valid blog attributes' do
    patch "/blogs/#{@blog.id}", params: {
      blog: {
        id: @blog.id,
        title: new_title,
        body: new_body
      }
    }

    expect(response).to have_http_status(:success)

    json = JSON.parse(response.body).deep_symbolize_keys
    
    # check the value of the returned response hash
    expect(json[:title]).to eq(new_title)
    expect(json[:body]).to eq(new_body)
  end

  scenario 'invalid blog attributes' do
    patch "/blogs/#{@blog.id}", params: {
      blog: {
        id: @blog.id,
        title: '',
        body: new_body
      }
    }

    expect(response).to have_http_status(422)
  end
end