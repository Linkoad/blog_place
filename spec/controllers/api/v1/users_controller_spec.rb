#require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::UserController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/vnd.blog_place.v1" }

  describe "GET #show" do
    before (:each) do
      @user = FactoryBot.create :user
      get :show, id: @user.id, format: :json
    end

    it "returns the information about a reporter on hash" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end
end
