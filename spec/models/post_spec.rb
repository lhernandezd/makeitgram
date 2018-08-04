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
  end
end