require "rails_helper"
 describe "the signin process" do
  before :each do
    @user = create(:user, password: 'rickandmorty')
  end
   it "creating post" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'rickandmorty'
    end
    click_button 'Log in'
    visit '/posts/new'
    within("#new_post") do
      page.attach_file('post_photo','spec/factories/wolf.jpg')
      fill_in 'Description', with: 'Toma lo tuyo'
      fill_in 'Location', with: 'Toma lo tuyo'
    end
    click_button 'Submit'
   
    expect(page).to have_content 'The post was successfully created'

    visit '/posts'
    expect(page).to have_selector(:css, "div")
  end
end