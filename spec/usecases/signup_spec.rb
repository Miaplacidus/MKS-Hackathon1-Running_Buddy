require 'spec_helper'

describe 'SignUp' do
  before do
    @db = RunB.db
  end

  it "errors, if username is already taken" do
    @db.create_user("Speedo", "hello123", "24")
    result = subject.run(:username => "Speedo")
    expect(result.error?).to eq(true)
    expect(result.error).to eq(:username_taken)
  end
  xit "errors, if password length is less than 5 characters" do
    result = subject.run(:username => "Speedy_pants", :pw =>"123")
    expect(result.error?).to eq(true)
    expect(result.error).to eq(:weak_password)
  end
  xit "passes, if username and password is both acceptable and user inputed age" do
    result = subject.run(:username=>"Speedy_pants", :pw =>"hello123", :age=> "24")
    expect(result.success?).to eq(true)
  end
end
