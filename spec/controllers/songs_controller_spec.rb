require 'rails_helper'

RSpec.describe SongsController, type: :controller do
  before do
    @user = create(:user)
    @song = create(:song)
  end
  context "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access index" do
      get :index
      expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access create" do
      post :create
      expect(response).to redirect_to("/sessions/new")
    end
  end
end
