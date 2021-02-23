require 'rails_helper'

RSpec.describe 'Devise Token Auth', :type => :request do
  it 'registers a user' do
    headers = { 'ACCEPT' => 'application/json' }
    params = { 
        :email => 'florencia.mosquera@rootstrap.com',
        :password => 'password',
        :password_confirmation => 'password',
        :gender => :female
    }
    post '/auth', :params => params, :headers => headers

    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(response).to have_http_status(:ok)
  end
end