require 'spec_helper'

describe RunB::PostARun do
  before do
    @db = RunB.db
    @userTest = @db.create_user("Speedo", "hello123", 2, "testing@test.com", 2, 3, "male")
    @postTest = @db.create_post(@userTest.id, "11:00AM CST", "12th Street, Austin, TX", 4, 10)
  end

  it "errors, if creator_id is wrong" do
    result = subject.run(:creator_id => 20)
    expect(result.error).to eq(:wrong_creator_id)
    expect(result.error?).to eq(true)
  end
  xit "errors, if time is wrong" do
    result = subject.run(:creator_id => @userTest.id, :time => "12:00PM CST")
    expect(result.error).to eq(:wrong_time)
    expect(result.error?).to eq(true)
  end
  xit "errors, if location is wrong" do
    result = subject.run(:creator_id => @userTest.id, :time => "11:00AM CST", :location => "wrong address")
    expect(result.error).to eq(:wrong_location)
    expect(result.error?).to eq(true)
  end
  xit "errors, if pace is wrong" do
    result = subject.run(:creator_id => @userTest.id, :time => "12:00PM CST", :location => "12th Street, Austin, TX", :pace => 2)
    expect(result.error).to eq(:wrong_pace)
    expect(result.error?).to eq(true)
  end
  xit "errors, if minimum commitment is wrong" do
    result = subject.run(:creator_id => @userTest.id, :time => "12:00PM CST", :location => "12th Street, Austin, TX", :pace => 4, :min_commit => 15)
    expect(result.error).to eq(:wrong_min_commit)
    expect(result.error?).to eq(true)
  end
  xit "passes, if everything is there" do
    result = subject.run(:creator_id => @userTest.id, :time => "12:00PM CST", :location => "12th Street, Austin, TX", :pace => 4, :min_commit => 10)
    expect(result.success?).to eq(true)
  end
end

