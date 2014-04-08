require 'spec_helper'

describe RunB::SeeYourCircles do
  before do
    @db = RunB.db
    @user = @db.create_user("Speedo", "hello123", 2, "testing@test.com", 2, 3, "male")
    @user2 = @db.create_user("Bella", "yeo67s", 3, "bell@test.com", 3, 2, "female")
    @circle = @db.create_circle("Friends", @user.id, @user2.id)
  end

  xit "errors, " do

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

