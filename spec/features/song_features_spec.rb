require 'rails_helper'

feature "Song features" do
  before do
    @user = create(:user)
    log_in
    @song = create(:song)
    @song2 = create(:song, title: 'Other Song')
  end

  feature "Songs Dashboard" do
    before(:each) do
      visit "/songs"
    end
    scenario "displays all songs" do
      expect(page).to have_text(@song.title)
      expect(page).to have_text(@song2.title)
    end
    scenario "add a new song" do
      fill_in "song[title]", with: "Another Song"
      fill_in "song[artist]", with: "Another Artist"
      click_button "Add Song"
      expect(current_path).to eq("/songs")
      expect(page).to have_text("Another Song")
      expect(page).to have_text("Another Artist")
    end
  end

  feature "Songs show page" do
    before do
      @playlist = create(:playlist, user: @user, song: @song)
    end
    before(:each) do
      visit "/songs/#{@song.id}"
    end
    scenario "displays correct information" do
      expect(page).to have_text(@song.title)
      expect(page).to have_text(@song.artist)
    end
    scenario "displays users who have added song to playlist" do
      expect(page).to have_text(@user.first_name)
      expect(page).to have_text(@user.last_name)
    end
    scenario "displays correct count of times song has been added by a particular user" do
      expect(page).to have_text("1")
    end
  end
end
