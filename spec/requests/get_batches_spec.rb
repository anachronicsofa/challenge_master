require 'rails_helper'
describe 'get all batch route', :type => :request do
  let!(:batch)
  before {get '/api/v1/batches'}
  it 'returns all questions' do
    expect(JSON.parse(response.body).size).to eq(5)
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end