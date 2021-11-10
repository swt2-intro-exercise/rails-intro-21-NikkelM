require 'rails_helper'

describe 'Authors edit page', type: :feature do
  it 'exists' do
	author = Author.create(first_name:"Alan", last_name:"Turing")
  visit edit_author_path(author)
  end

  it 'properly edits an author' do
	author = Author.create(first_name:"Alan", last_name:"Turinger")
  visit edit_author_path(author)
	fill_in 'author[last_name]', with: "Turing"
  submit_form
	author.reload
	expect(author.last_name).to eq('Turing')
  end

	it 'should have the option to delete an author' do
		author = Author.create(first_name:"Alan", last_name:"Turing")
		visit edit_author_path(author)
		expect(page).to have_link('Delete', href: author_path(author))
	end

	it 'should be able to delete an author' do
		author = Author.create(first_name:"Alan", last_name:"Turing")
		visit edit_author_path(author)
		count = Author.count
		click_link('Delete')
		assert(Author.count < count)
	end


end