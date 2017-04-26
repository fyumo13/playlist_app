require 'rails_helper'

RSpec.describe Song, type: :model do
  context "with valid attributes" do
    it "should save" do
      expect(build(:song)).to be_valid
    end
  end

  context "with invalid attributes should not save if" do
    it "title is blank" do
      expect(build(:song, title: '')).to be_invalid
    end
    it "artist is blank" do
      expect(build(:song, artist: '')).to be_invalid
    end
  end
end
