require 'rails_helper'

describe 'Authors edit page', type: :feature do
  it 'exists' do
	author = Author.create(first_name:"Alan", last_name:"Turing")
    visit edit_author_path(author)
  end
end