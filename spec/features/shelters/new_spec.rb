# User Story 4, Shelter Creation
#
# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.

 require 'rails_helper'

 describe 'As a visitor when I visit the shelter index page I see a link to add
          a new shelter. When I click the link I am taken /shelters/new' do

  it "shows fields to fill in the shelter name, address, city, state and zip." do
    visit '/shelters'
    click_link "Add New Shelter"

    expect(current_path).to eq('/shelters/new')
    fill_in :name, with: "Barkin' Doggos"
    fill_in :address, with: "5112 Barkin Plaza"
    fill_in :city, with: "Hollywood"
    fill_in :state, with: "CA"
    fill_in :zip, with: 20938
    click_button "Create New Shelter"

    expect(current_path).to eq('/shelters')

    new_shelter = Shelter.last
    within "#shelter-#{new_shelter.id}" do
      expect(page).to have_content(new_shelter.name)
      click_link("#{new_shelter.name}")
      expect(current_path).to eq("/shelters/#{new_shelter.id}")
      expect(page).to have_content("Barkin' Doggos")
      expect(page).to have_content("5112 Barkin Plaza")
      expect(page).to have_content("Hollywood")
      expect(page).to have_content("CA")
      expect(page).to have_content(20938)
    end
  end
end
