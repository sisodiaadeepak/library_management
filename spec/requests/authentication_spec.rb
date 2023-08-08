require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe 'POST #login' do
    let!(:user) { User.create( email: 'test@example.com', password: 'password', username: "test") }

    context 'when valid login credentials are provided' do
      before do
        post :login, params: { email: 'test@example.com', password: 'password' }
      end

      it 'returns a JWT token' do
        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response['token']).to be_present
      end

      it 'returns an expiration time' do
        json_response = JSON.parse(response.body)
        expect(json_response['exp']).to be_present
      end

      it 'returns the username' do
        json_response = JSON.parse(response.body)
        expect(json_response['username']).to eq(user.username)
      end
    end

    context 'when invalid login credentials are provided' do
      before do
        post :login, params: { email: 'test@example.com', password: 'wrong_password' }
      end

      it 'returns unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns an error message' do
        json_response = JSON.parse(response.body)
        expect(json_response['error']).to eq('unauthorized')
      end
    end
  end
end
