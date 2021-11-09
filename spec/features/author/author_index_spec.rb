require 'rails_helper'

describe "Author index page", type: :feature do
  subject { page }

  it "should exist at 'index' and render without error" do
    visit authors_path
  end

  it "should contain a link to the create a new author page" do
    visit authors_path
    should have_link('New Author', href: new_author_path)
  end

end
