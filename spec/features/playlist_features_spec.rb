require 'rails_helper'

feature "Playlist features" do
  before do
    @user = create(:user)
    @song = create(:song)
    log_in
  end

  feature "song has not been added to playlist" do
    before(:each) do
      visit "/songs"
    end
    scenario "Add button is visible" do
      expect(page).to have_button("Add")
    end
  end

  feature "song has been added to playlist" do
    before do
      @playlist = create(:playlist, user: @user, song: @song)
    end
    before(:each) do
      visit "/songs"
    end
    scenario "count of times song has been added is correct" do
      expect(page).to have_text("1")
    end
  end
end
