require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render without error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end
  
  it "should contain input fields for author name and homepage" do
    visit new_author_path
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should not allow an author to be created without a last name" do
    author = Author.create(first_name:"Alan", homepage:"http://example.com")
    expect(author).to_not be_valid
  end

end
