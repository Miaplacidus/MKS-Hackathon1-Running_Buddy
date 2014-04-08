require 'spec_helper'

describe 'CreateCircle' do
  before do
    @db = RunB.db
    @user = @db.create_user("Speedo", "hello123", 2, "testing@test.com", 2, 3, "male")
    @user2 = @db.create_user("Bella", "yeo67s", 3, "bell@test.com", 3, 2, "female")
    @circle = @db.create_circle("Friends", @user.id, @user2.id)
  end

  it "errors, if circle name is taken" do
    result = subject.run(:name =>"Family")
    expect(result.error).to eq(:circle_taken)
    expect(result.error?).to eq(true)
  end
  it "errors, if creator id is wrong" do
    result = subject.run(:name =>"Family", :creator_id=>123, :joiner_id=> 0303)
    expect(result.error).to eq(:wrong_creator_id)
    expect(result.error?).to eq(true)
  end
  xit "errors, if joiner_id is wrong" do
    result = subject.run(:name =>"Friends", :creator_id=>@user.id, :joiner_id=> 0303)
    expect(result.error).to eq(:wrong_joiner_id)
    expect(result.error?).to eq(true)
  end
  xit "passes, if all info is available and accesible" do
    result = subject.run(:name =>"Friends", :creator_id=>@user.id, :joiner_id=> @user2.ud)
    expect(result.success?).to eq(true)
    expect(result.circle).to be_a(circle)
  end
end

