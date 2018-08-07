require "rails_helper"
describe Comment do
  describe "creation" do
    before :each do
      @user = create(:user)
      @post = create(:post_with_attachment, user_id: @user.id)
    end

     context "with valid comment" do
      it "should be valid" do
        comment = build(:comment, post_id: @post.id, user_id: @user.id)
        expect(comment.save).to be true
      end
    end

    context "with invalid comment" do
      it "should not be valid without text" do
        comment = build(:comment, post_id: @post.id, user_id: @user.id, text:nil)
        expect(comment.save).to be false
      end
    end

  end
end