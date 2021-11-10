require 'rails_helper'

describe 'Authors edit page', type: :feature do
  it 'exists' do
    visit edit_authors_path
  end
end