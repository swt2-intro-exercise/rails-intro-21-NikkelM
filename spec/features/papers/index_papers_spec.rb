require 'rails_helper'

describe "Papers index page", type: :feature do
  subject { page }

  it "should exist at 'index' and render without error" do
    visit papers_path
  end

  it "should contain a link to the create a new paper page" do
    visit papers_path
    should have_link('New Paper', href: new_paper_path)
  end

end

describe 'Papers table', type: :feature do

  it 'exists' do
    visit papers_path
    expect(page).to have_css('table')
  end

  it "should correctly display a table containing Title, Venue and Year of the paper" do
    paper = Paper.create(title:"Funny Name", venue:"HPI Conference", year:"2020")
    visit papers_path
    within 'table' do
      expect(page).to have_text('Funny Name')
      expect(page).to have_text('HPI Conference')
      expect(page).to have_text('2020')
    end
  end
end
