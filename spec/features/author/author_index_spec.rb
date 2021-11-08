require 'rails_helper'

describe "Author index page", type: :feature do
  it "should exist at 'index' and render without error" do
    visit authors_path
  end

  it "should contain a link to the create a new author page" do
    expect(authors_path).to have_link 'New', href: new_author_path
  end
end
