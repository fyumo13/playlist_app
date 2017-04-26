require 'rails_helper'

RSpec.describe Playlist, type: :model do
  context "relationships" do
    before do
      @user = create(:user)
      @song = create(:song)
      @playlist = create(:playlist, user: @user, song: @song)
    end
    it "belongs to a user" do
      expect(@playlist.user).to eq(@user)
    end
    it "belongs to a song" do
      expect(@playlist.song).to eq(@song)
    end
  end
end
