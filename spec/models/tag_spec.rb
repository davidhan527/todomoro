require 'spec_helper'

describe Tag do
  it "is valid with a name" do
      tag = Tag.new(name: 'tag1')
      expect(tag).to be_valid
  end

  it "is invalid without a name" do
    expect(Tag.new(name: nil)).to have(1).errors_on(:name)
  end
end