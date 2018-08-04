require "rails_helper"
 describe Post do
  describe "creation" do
    before :each do
      @user = create(:user)
    end

     context "with valid attributes" do
      it "should be valid" do
        post = build(:post_with_attachment, user_id: @user.id)
        expect(post.save).to be true
      end
    end

    context "with invalid attributes" do
      it "should not be valid without description" do
        post = build(:post_with_attachment, description: nil, user_id: @user.id)
        expect(post.save).to be false
      end
       it "should not be valid without photo" do
        post = build(:post_with_attachment, photo: nil, user_id: @user.id)
        expect(post.save).to be false
      end
       it "should not be valid without author (user_id)" do
        post = build(:post_with_attachment)
        expect(post.save).to be false
      end
    end
    
  end
end