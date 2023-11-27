# spec/requests/blogs/destroy_blog_spec.rb

require 'rails_helper'

describe 'DELETE /blogs' do

  let(:title) { 'Rspec test blog' }
  let(:body) { 'This is to test the update blog request' }

  before do
    @blog = Blog.create(title: title, body: body)
  end
  
  scenario 'valid blog attributes' do
    delete "/blogs/#{@blog.id}"

    expect(response).to have_http_status(:no_content)
  end

  scenario 'invalid blog attributes' do
    delete "/blogs/#{@blog.id.to_i + 1}"

    expect(response).to have_http_status(422)
  end
end