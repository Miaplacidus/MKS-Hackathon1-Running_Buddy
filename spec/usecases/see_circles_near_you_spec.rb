require 'spec_helper'

describe RunB::SeeCirclesNearYou do
  before do
    @db = RunB.db
    @circle = @db.create_circle("Friends", @user.id, @user2.id)
    @
  end

  it "errors, if circle doesn't exist" do
    result = subject.run(:circle_id=> )
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

