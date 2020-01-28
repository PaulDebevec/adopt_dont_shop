require 'rails_helper'

describe "Delete a shelter" do
  describe "As a visitor I can delete shelters" do
    before :each do
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: 80207)
      @fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: 10001)
      @boulder_rescue = Shelter.create(name: "Boulder Rescue", address: "2712 Slobbery Circle", city: "Boulder", state: "CO", zip: 80205)

      visit "/shelters/#{@boulder_rescue.id}"
    end

    it "destroys the shelter, and it is no longer shown on the index page." do
      click_link "Delete #{@boulder_rescue.name}"
      expect(current_path).to eq('/shelters')
      expect(page).to_not have_content("Boulder Rescue")
    end
  end
end
