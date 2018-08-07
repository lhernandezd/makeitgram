require "rails_helper"
 describe PostsController do
  before :each do
    @user = create(:user)
  end
   describe "GET index" do
    it "responds successfully with HTTP 200 status code" do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status 200
    end
     it "render the index template" do
      get :index
      expect(response).to render_template(:index)
    end
     it "loads all created posts" do
      post1 = create(:post_with_attachment, user_id: @user.id)
      post2 = create(:post_with_attachment, user_id: @user.id)
      get :index
      expect(assigns(:posts)).to eq([post2, post1])
    end
  end
   describe "GET new" do
    it "redirect to login page if user is not authenticated" do
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end
     it "render new template if user is authenticated" do
      sign_in @user
      get :new
      expect(response).to render_template(:new)
    end
  end
end 