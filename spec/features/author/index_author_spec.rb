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

describe 'Authors table', type: :feature do

  it 'exists' do
    visit authors_path
    expect(page).to have_css('table')
  end

  it "should correctly display a table containing name and Homepage of the author and a link to the authors page" do
    author = Author.create(first_name:"Alan", last_name:"Turing", homepage:"http://wikipedia.de/alan_turing")
    visit authors_path
    within 'table' do
      expect(page).to have_text('Alan Turing')
      expect(page).to have_link('Show', href: author_path(author))
    end
  end
end
