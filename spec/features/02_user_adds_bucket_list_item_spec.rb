require "spec_helper"

feature "user adds bucket list item" do
  scenario "when valid form submitted" do
    visit "/launcher-bucket-list"

    fill_in "Add New Goal to Bucket List", with: "Gotta catch 'em all"
    click_on "Add"

    expect(page).to have_content("Gotta catch 'em all")
  end

  scenario "when not valid submission empty li element is not added to the page" do
    visit "/launcher-bucket-list"
    click_on "Add"

    expect(page).not_to have_selector("li")
  end
end
