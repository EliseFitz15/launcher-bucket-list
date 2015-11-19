require "spec_helper"

feature "user sees bucket list items" do
  scenario "user views all bucket list items" do
    CSV.open("bucket_list.csv", "a", headers: true) do |file|
      goal = "Learn Ruby"
      file.puts([goal])
    end

    visit "/groceries"
    expect(page).to have_content("Learn Ruby")
  end

  scenario "user sees all bucket items at root path" do
    CSV.open("bucket_list.csv", "a", headers: true) do |file|
      goal = "Pair program with everyone"
      file.puts([goal])
    end
    visit "/"
    expect(page).to have_content("Pair program with everyone")
  end
end
