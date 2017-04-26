require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  before do
    @user = create(:user)
    @song = create(:song)
    @playlist = create(:playlist, user: @user, song: @song)
  end
  context "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot add a song to playlist" do
      post :create
      expect(response).to redirect_to("/sessions/new")
    end
  end
end
