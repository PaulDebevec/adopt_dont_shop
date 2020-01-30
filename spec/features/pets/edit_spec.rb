require 'rails_helper'

describe "Pet edit page" do
  describe "As a visitor when I navigate to a pets show page" do
    before(:each) do
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: 80207)
      @rue = @howlin_puppers.pets.create(image: "https://steemitimages.com/DQmZyHkjuh4NLQLMAzTXVyz7CPTmtarfXm673bXQphJqoii/22-24_tn.jpg",
        name: 'Rue',
        approximate_age: 1,
        description: "I'm a gargoyle sometimes",
        sex: 'Female')
    end

    it "I see an 'Edit Pet' button and when I click it I am taken to a form to edit the pet" do
      visit "/pets/#{@rue.id}"
      click_link "Edit #{@rue.name}"

      expect(current_path).to eq("/pets/#{@rue.id}/edit")

      fill_in :name, with: 'Rwo Chains'
      click_button "Save"

      expect(current_path).to eq("/pets/#{@rue.id}")
      expect(page).to have_content("Rwo Chains")
      expect(page).to have_css("img[src*='#{@rue.image}']")
      expect(page).to have_content(@rue.approximate_age)
      expect(page).to have_content(@rue.sex)
      expect(page).to have_content(@rue.description)
    end
  end
end
