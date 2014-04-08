require 'spec_helper'

describe RunB::JoinCircle do
  before do
    @db = RunB.db
    @user = @db.create_user("Speedo", "hello123", 2, "testing@test.com", 2, 3, "male")
    @user2 = @db.create_user("Bella", "yeo67s", 3, "bell@test.com", 3, 2, "female")
    @circle = @db.create_circle("Friends")
    @new_circle = @db.update_circle(@circle.id, "Friends", @user2.id)
  end

  xit "errors, if circle is missing" do
    result = subject.run(:circle_id => 90)
    expect(result.error).to eq(:missing_circle)
    expect(result.error?).to eq(true)
  end
  xit "errors, if creator id is missing" do
    result = subject.run(:circle_id => @circle.id)
    expect(result.error).to eq(:missing_creator)
    expect(result.error?).to eq(true)
  end
  xit "errors, if joiner id is missing" do
    result = subject.run(:circle_id =>@circle.id, :creator_id=>@user.id)
    expect(result.error).to eq(:missing_joiner)
    expect(result.error?).to eq(true)
  end

  xit "passes, if all info are accessible" do
    result = subject.run(:circle_id =>@circle.id, :creator_id=>@user.id, :joiner_id =>@user2.id)
    expect(result.success?).to eq(true)

  end
end

