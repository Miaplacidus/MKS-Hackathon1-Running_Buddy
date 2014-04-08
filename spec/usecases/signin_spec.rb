require 'spec_helper'

describe RunB::SignIn do
  before do
    @db = RunB.db
  end

  xit "errors, if username doesn't exist" do
    result = subject.run(:username => "Tom", :pw => "1234")
    expect(result.error).to eq(:username_missing)
    expect(result.error?).to eq(true)
  end
  xit "errors, if password is incorret" do
    wendy = @db.add_user("Wendy", "23")
    result = subject.run(:username =>"Wendy", :pw => "134")
    expect(result.error).to eq(:incorrect_password)
    expect(result.error?).to eq(true)
  end
  xit "passes, if both username and password matches" do
    wendy = @db.add_user("Wendy", "1234")
    result = subject.run(:username => "Wendy", :pw=>"1234")
    expect(result.success?).to eq(true)
    expect(result.session_id).to be_a(Integer)
    expect(@db.get_user_from_session(result.session_id).name).to eq("Wendy")
  end
end

