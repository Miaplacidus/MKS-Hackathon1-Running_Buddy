require 'spec_helper'

describe 'SignUp' do
  before do
    @db = RunB.db
    @userTest = @db.create_user("Speedo", "hello123", 2, "testing@test.com", 2, 3, "male")
  end

  it "errors, if username is already taken" do
    result = subject.run(:username => "Speedo")
    expect(result.error?).to eq(true)
    expect(result.error).to eq(:username_taken)
  end
  xit "errors, if password length is less than 5 characters" do
    result = subject.run(:username => "Speedy_pants", :pw =>"123")
    expect(result.error?).to eq(true)
    expect(result.error).to eq(:weak_password)
  end
  xit "errors, if no age is inputted" do
    result = subject.run(:username => "Speedy_pants", :pw: "123hello", :age => nil)
    expect(result.error?).to eq(true)
    expect(result.error).to eq(:missing_age)
  end
  xit "errors, if no email is inputted" do
    result = subject.run(:username => "Speedy_pants", :pw: "hellow123", :age => 3, :email => nil)
    expect(result.error?).to eq(true)
    expect(result.error).to eq(:missing_email)
  end
  xit "errors, if no buddy preference is given" do
    result = subject.run(:username => "Speedy_pants", :pw: "hellow123", :age => 3, :email => "me@apple.com", :buddy_age => 2, :buddy_gender => nil)
    expect(result.error?).to eq(true)
    expect(result.error).to eq(:missing_buddy_gender_preference)
  end
  xit "passes, if username and password is both acceptable and user inputed age" do
    result = subject.run(:username=>"Speedy_pants", :pw =>"hello123", :age => 2, :email => "me@apple.com", :buddy_age => 2, :buddy_gender => 2)
    expect(result.success?).to eq(true)
  end

end
