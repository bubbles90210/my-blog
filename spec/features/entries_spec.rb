require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Guest" do
  before(:each) do
    @entry = FactoryGirl.create(:entry)
  end

  it "should be able to read entries" do
    visit "/entries/#{@entry.id}"
    expect(page).to have_selector("h2", text: @entry.title)
    expect(page).to have_selector("p", text: @entry.content)
  end

  it "should not see admin links" do
    # expect(page).not_to have_selector("h2", text: @entry.title)
    # expect(page).not_to have_selector("p", text: @entry.content)
  end
end

describe "Admin" do
  before(:each) do
    @entry = FactoryGirl.create(:entry)
    user = FactoryGirl.create(:user)
    user.add_role :admin
    login_as(user, scope: user)
  end

  after(:each) do
    Warden.test_reset!
  end

  it "should see admin links" do
    pending
  end

  it "should be able to read entries" do
    visit "/entries/#{@entry.id}"
    expect(page).to have_selector("h2", text: @entry.title)
    expect(page).to have_selector("p", text: @entry.content)
  end
end

  
#   scenario "as admin" do
    
#   end

#   describe "creation" do
#     before { visit new_entry_path }

#     describe "success" do
#       before(:each) do
#         fill_in "Title", with: @entry.title
#         fill_in "Content", with: @entry.content        
#       end

#       it "should add entry to database" do
#         expect { click_button "Create Entry" }.to change(Entry, :count).by(1)
#       end

#       it "should redirect to show the new entry" do
#         click_button "Create Entry"
#         expect(page).to have_selector("h2", text: @entry.title)
#         expect(page).to have_selector("p", text: @entry.content)
#       end

#       it "should show a flash[:success] message" do
#         click_button "Create Entry"
#         expect(page).to have_selector(".alert-success")
#       end
#     end

#     describe "failure" do
#       it "should not add entry to database" do
#         fill_in "Title", with: ""
#         fill_in "Content", with: ""
#         expect { click_button "Create Entry" }.not_to change(Entry, :count)
#       end

#       it "should show flash[:error] message" do
#         click_button "Create Entry"
#         expect(page).to have_selector(".alert-error")
#       end
#     end
#   end
# end

# require 'spec_helper'

# describe "Entry" do
#   before { @entry = FactoryGirl.build(:entry) }

#   describe "creation" do
#     before { visit new_entry_path }

#     describe "success" do
#       before(:each) do
#         fill_in "Title", with: @entry.title
#         fill_in "Content", with: @entry.content        
#       end

#       it "should add entry to database" do
#         expect { click_button "Create Entry" }.to change(Entry, :count).by(1)
#       end

#       it "should redirect to show the new entry" do
#         click_button "Create Entry"
#         expect(page).to have_selector("h2", text: @entry.title)
#         expect(page).to have_selector("p", text: @entry.content)
#       end

#       it "should show a flash[:success] message" do
#         click_button "Create Entry"
#         expect(page).to have_selector(".alert-success")
#       end
#     end

#     describe "failure" do
#       it "should not add entry to database" do
#         fill_in "Title", with: ""
#         fill_in "Content", with: ""
#         expect { click_button "Create Entry" }.not_to change(Entry, :count)
#       end

#       it "should show flash[:error] message" do
#         click_button "Create Entry"
#         expect(page).to have_selector(".alert-error")
#       end
#     end
#   end
# end
