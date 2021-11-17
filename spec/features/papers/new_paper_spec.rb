require 'rails_helper'

describe "New Paper page", type: :feature do
  it "should exist at 'new_author_path' and render without error" do
    visit new_paper_path
  end
  
  it "should contain input fields for title, venue and year" do
    visit new_paper_path
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should not allow a paper to be created without a year" do
    paper = Paper.create(title:"Funny Paper", venue:"HPI Conference")
    expect(paper).to_not be_valid
  end

  it "should not allow a paper to be created with the year not being an integer" do
    paper = Paper.create(title:"Funny Paper", venue:"HPI Conference", year:"Hello")
	paper2 = Paper.create(title:"Funny Paper", venue:"HPI Conference", year:"2020.5")
    expect(paper).to_not be_valid
  end

	it "should not allow a paper to be created without a venue" do
    paper = Paper.create(title:"Funny Paper", year:"2020")
    expect(paper).to_not be_valid
  end

	it "should not allow a paper to be created without a title" do
    paper = Paper.create(venue:"HPI Conference", year:"2020")
    expect(paper).to_not be_valid
  end

  it "should show the user an error when the entered paper is invalid" do
    visit new_paper_path
    fill_in 'paper[title]', with: "Funny Name"
    fill_in 'paper[venue]', with: "HPI Conference"
    submit_form
    expect(page).to have_text('error')
  end

  it "should show the associated authors names" do
    author = Author.create(first_name:"Alan", last_name:"Turing", homepage:"http://example.com")

	visit new_paper_path
    fill_in 'paper[title]', with: "Funny Name"
    fill_in 'paper[venue]', with: "HPI Conference"
    fill_in 'paper[year]', with: "2009"
	expect(page).to have_text('Alan Turing')
	page.check('Alan Turing')
	submit_form
	expect(page).to have_text('Alan Turing')
  end

end
