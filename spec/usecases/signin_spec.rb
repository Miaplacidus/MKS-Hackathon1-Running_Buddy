require 'spec_helper'

describe 'SignIn' do
  before do
    @db = RunB.db
  end

  it "errors, if username doesn't exist" do
    result = RunB::SignIn.run(:username => "Tom", :pw => "1234")
    expect(result.error).to eq(:username_missing)
    expect(result.error?).to eq(true)
  end
  xit "errors, if password is incorret" do
    wendy = @db.add_user("Wendy", "23")
    result = RunB::SignIn.run(:username =>"Wendy", :pw => "134")
    expect(result.error).to eq(:incorrect_password)
    expect(result.error?).to eq(true)
  end
  xit "passes, if both username and password matches" do
    wendy = @db.add_user("Wendy", "1234")
    result = RunB::SignIn.run(:username => "Wendy", :pw=>"1234")
    expect(result.success?).to eq(true)
    expect(result.session_id).to be_a(Integer)
    expect(@db.get_user_from_session(result.session_id).name).to eq("Wendy")
  end
end

