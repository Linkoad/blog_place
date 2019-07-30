#require 'spec_helper'
require 'rails_helper'

describe Api::V1::UsersController do
  before(:each) { request.headers['Accept'] = "application/vnd.blog_place.v1" }


  describe "GET #show" do
    before(:each) do
      @user = FactoryBot.create (:user)
      get :show, params: { id: @user.id }, format: :json
    end

    it "returns the information about a reporter on a hash" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do

    context "when is successfully created" do
      before(:each) do
<<<<<<< HEAD
        @user_attributes = FactoryBot.attributes_for :user
=======
        @user_attributes = FactoryBot.attributes_for(:user)
>>>>>>> 295650a67ca231ab31fb354acb19ab54d28d564a
        post :create, params: { user: @user_attributes }, format: :json
      end

      it "renders the json representation for the user record just created" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:email]).to eql @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
<<<<<<< HEAD
        # notice I'm not including the email
        @invalid_user_attributes = { password: "12345678",

                                     password_confirmation: "12345678" }
        post :create, params: { user: @invalid_user_attributes },
          format: :json
=======
        @invalid_user_attributes = FactoryBot.invalid_user_attributes_for { password: '12345678',
                                     password_confirmation: '12345678' }
        post :create, { user: @invalid_user_attributes }, format: :json
>>>>>>> 295650a67ca231ab31fb354acb19ab54d28d564a
      end

      it "renders an errors json" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on whye the user could not be created" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors][:email]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @user = FactoryBot.create :user
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, params: { id: @user.id, user: { email: "newmail@example.com" } },
          format: :json
      end

      it "renders the json representation for the updated user" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:email]).to eql(user_response) 
      end

      it { should respond_with 422 }
    end

    context "when is not created" do
      before(:each) do
        patch :update, params: { id: @user.id, user: { email: "bademail.com" } },
          format: :json
      end

      it "renders an errors json" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on whye the user could not be created" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors][:email]).to include "is invalid"
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @user = FactoryBot.create :user
      delete :destroy, params: { id: @user.id }, format: :json
    end

    it { should respond_with 204 }

  end
end
