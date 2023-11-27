# spec/requests/blogs/create_blog_spec.rb

require 'rails_helper'

describe 'POST /blogs' do
  let(:title) { 'Rspec test blog' }
  let(:body) { 'This is to test the create blog request' }
  
  scenario 'valid blog attributes' do
    post '/blogs', params: {
      blog: {
        title: title,
        body: body
      }
    }

    expect(response).to have_http_status(:success)

    json = JSON.parse(response.body).deep_symbolize_keys
    
    # check the value of the returned response hash
    expect(json[:title]).to eq(title)
    expect(json[:body]).to eq(body)
  end

  scenario 'invalid blog attributes' do
    post '/blogs', params: {
      blog: {
        title: '',
        body: body
      }
    }

    expect(response).to have_http_status(422)
  end
end