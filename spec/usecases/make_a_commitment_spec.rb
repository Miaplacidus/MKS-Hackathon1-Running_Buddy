require 'spec_helper'

describe 'MakeACommitment' do
  before do
    @db = RunB.db
    @userTest = @db.create_user("Speedo", "hello123", 2, "testing@test.com", 2, 3, "male")
    @postTest = @db.create_post(@userTest.id, "11:00AM CST", "12th Street, Austin, TX", 4, 10)
    @commitmentTest = @db.create_commitment(@userTest.id, 10, @postTest.id)
  end

  xit "errors, if user_id is wrong" do
    result = RunB::MakeACommitment.run(:user_id => 50)
    expect(result.error).to eq(:wrong_user_id)
    expect(result.error?).to eq(true)
  end
  xit "errors, if amount is more than 15 dollars" do
    result = RunB::MakeACommitment.run(:user_id => @userTest.id, :amount => 20)
    expect(result.error).to eq(:amount_not_acceptable)
    expect(result.error?).to eq(true)
  end
  xit "errors, if post_id is wrong" do
    result = RunB::MakeACommitment.run(:user_id => @userTest.id, :amount => 10, :post_id => 75)
    expect(result.error).to eq(:wrong_post_id)
    expect(result.error?).to eq(true)
  end
  xit "passes, if everything is there" do
    result = RunB::MakeACommitment.run(:user_id => @userTest.id, :amount => 10, :post_id => @postTest.id)
    expect(result.success?).to eq(true)
  end
end

