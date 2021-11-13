require 'rails_helper'

describe "Papers", type: :model do
  it "should have an empty list of authors" do
    paper = Paper.create(title:"A conjoined worl", venue:"HPI Conference", year:"2020")
    paper.authors.empty?
  end
end