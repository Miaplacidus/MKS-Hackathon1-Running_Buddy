require 'spec_helper'

describe 'Database' do
  before do
    @db = RunB.db
    user1 = @db.create_user("John Doe", "123456", 25)
    user2 = @db.create_user("Jane Smith", "654321", 23)
    user3 = @db.create_user("Bugs Bunny", "abcdef", 19)
  end

  describe 'Users' do
    it 'can be created with name, password, age, and retreived' do
      expect(@db.get_user(user1.id)).to eq (user1.id)
    end

    it 'can display users history of runs' do
      @db.create_post(user1.id, "8am", "716 Congress Ave., Austin, TX")
      @db.update_post()

    end

    it 'can delete a user' do
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

      expect(@db.ls_post).to eq({post2, post3, post4})
    end

    it "can delete a post/run" do
      post5 = @db.create_post(user1.id, "8am", "716 Congress Ave., Austin, TX")
      post6 = @db.create_post(user2.id, "6pm", "1300 Crossing Place, Austin, TX")
      post7 = @db.create_post(user3.id, "8pm", "Downtown, Austin, TX")
      @db.delete_post(post6.id)

      expect(@db.ls_post).to eq({post5, post7})
    end

end
