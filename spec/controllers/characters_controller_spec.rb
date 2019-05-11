require 'rails_helper'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Name.name }
    password { "password"} 
    password_confirmation { "password" }
    confirmed_at { Date.today }
  end
end

RSpec.describe CharactersController, type: :controller do
  describe "GET new" do
    it "renders the new template" do
      sign_in FactoryBot.create(:user)
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    it "create a new character" do
      user = FactoryBot.create(:user)
      sign_in user
      session[:character_params] ||= {}
      post :create, params: {
        character: {
          name: Faker::Name.name,
          color_claws: :gray,
          kind: :hunter,
          user_id: user.id
        }
      }
      expect(response).to have_http_status(:ok)
    end
  end
end
