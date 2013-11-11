require 'spec_helper'

describe Task do
  it "is valid with a name" do
      task = Task.new(name: 'task1')
      expect(task).to be_valid
  end

  it "is invalid without a name" do
    expect(Task.new(name: nil)).to have(1).errors_on(:name)
  end

end
