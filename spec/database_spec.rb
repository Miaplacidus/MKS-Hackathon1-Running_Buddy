require 'spec_helper'

describe 'Database' do
  before do
    RunB.db_name = "RunningBuddy"
    @db = RunB.db
    user1 = @db.create_user("John Doe", "123456", 25, "john@doe.com", 2, 20, "male")
    user2 = @db.create_user("Jane Smith", "654321", 23, "jane@smith.com", 2, 22, "female")
    user3 = @db.create_user("Bugs Bunny", "abcdef", 19, "bugs@bunny.com", 2, 25, "male")
  end

  describe 'Users' do
    it 'can be created with name, password, age, and retreived' do

    end

    xit 'can display users history of runs' do
      @db.create_post(user1.id, "8am", "716 Congress Ave., Austin, TX")
      @db.update_post()
    end

    xit 'can delete a user' do
      @db.delete_user(user1.id)
      expect(@db.get_user(user1.id)).to be(nil)
    end
  end

  describe 'Posts/Runs' do
    it 'can create a post and retrieve it' do
      post1 = @db.create_post(user1.id, "8am", "716 Congress Ave., Austin, TX")
      result = @db.get_post(postTest.id)
      expect(result).to eq(post1)
    end

    it 'can list all posts/runs' do
      post2 = @db.create_post(user1.id, "8am", "716 Congress Ave., Austin, TX")
      post3 = @db.create_post(user2.id, "6pm", "1300 Crossing Place, Austin, TX")
      post4 = @db.create_post(user3.id, "8pm", "Downtown, Austin, TX")
      # expect(@db.ls_post).to eq({post2, post3, post4})
    end

    it "can delete a post/run" do
      post5 = @db.create_post(user1.id, "8am", "716 Congress Ave., Austin, TX")
      post6 = @db.create_post(user2.id, "6pm", "1300 Crossing Place, Austin, TX")
      post7 = @db.create_post(user3.id, "8pm", "Downtown, Austin, TX")
      @db.delete_post(post6.id)
      # expect(@db.ls_post).to eq({post5, post7})
    end

  end

  describe 'Wallet' do
    xit 'can be created and retrieved' do
      @db.create_wallet(user1.id, 10)

      result = @db.get_wallet_by_user(user1.id)
      expect(result).to eq(10)
    end

    xit 'funds can be added or removed' do
      wallet1 = @db.create_wallet(user1.id, 10)
      @db.update_wallet(wallet1.id, [amount => 100])

      expect(wallet1.amount).to eq(100)
    end
  end

  describe 'Circle' do
    xit 'can be created and retrieved' do
      circle1 = @db.create_circle("Austin Runners")
      expect(@db.get_circle(circle1.id)).to eq(circle1)
    end
  end

end
