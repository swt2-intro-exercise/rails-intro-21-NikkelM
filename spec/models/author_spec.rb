require 'rails_helper'

describe "Author page", type: :model do
    it "should have a first_name, last_name, homepage field" do
        author = Author.create(first_name:"Alan", last_name:"Turing", homepage:"http://wikipedia.de/Alan_Turing")
        expect(author.first_name).to eq("Alan")
        expect(author.last_name).to eq("Turing")
        expect(author.homepage).to eq("http://wikipedia.de/Alan_Turing")
    end
  end