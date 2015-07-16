require "rails_helper"
require "spec_helper"

describe WebsitesController, "creating a new website" do

	it "should redirect to new website path" do 
  		redirect_to new_website_path
	end

	it "should create variables named h1_title, paragraph and final_content" do
		 expect(@h1_title).to eq(nil)
		 expect(@paragraph).to eq(nil)
		 expect(@final_content).to eq(nil)
		
	end

end
