require 'spec_helper'

describe 'JoinARun' do
  before do
    @db = RunB.db
    @userTest = @db.create_user("Speedo", "hello123", 2, "testing@test.com", 2, 3, "male")
    @postTest = @db.create_post(@userTest.id, "11:00AM CST", "12th Street, Austin, TX", 4, 10)
  end

  xit "errors, if " do

    expect(result.error).to eq( )
    expect(result.error?).to eq(true)
  end
  xit "errors, " do

    expect(result.error).to eq( )
    expect(result.error?).to eq(true)
  end
  xit "passes, " do

    expect(result.success?).to eq(true)
    expect(result.session_id).to be_a( )
  end
end

