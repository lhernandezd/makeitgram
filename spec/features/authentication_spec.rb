require "rails_helper"
 describe "the signin process" do
  before :each do
    @user = create(:user, password: 'rickandmorty')
  end
   it "signs me in" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'rickandmorty'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
end