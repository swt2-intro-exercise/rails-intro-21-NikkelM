require 'rails_helper'

describe "Author index page", type: :feature do
  it "should exist at 'index' and render without error" do
    visit authors_path
  end

  it "should contain a link to the create a new author page" do
    expect(home_index_path).to have_link 'Author overview', href: authors_path
  end
end
