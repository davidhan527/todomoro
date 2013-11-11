require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without a name" do
    user = build(:user, name:nil)
    expect(user).to have(1).errors_on(:name)
  end

  it "has three tasks" do
    expect(create(:user).tasks.count).to eq 3
  end

end
