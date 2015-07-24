require "rails_helper"
require "spec_helper"

describe WebsitesController do
  let(:website) { double(Website).as_null_object }

  describe "GET new" do
    login_user
    it "responds successfully" do
      get :new
      expect(response).to be_success
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    login_user

    before do
     allow(Website).to receive(:new).and_return(website)
     allow(ContentExtractor).to receive_message_chain(:new, :extract)
    end

    it "creates new website" do
      expect(Website).to receive(:new).with("url" => "http://kotaku.com/").and_return(website)
      post :create, :website => {"url" => "http://kotaku.com/"}
    end

    it "assigns @website" do
      post :create, :website => {"url" => "http://kotaku.com"}
      expect(assigns[:website]).to eq(website)
    end

    it "saves the website" do
      expect(website).to receive(:save)
      post :create, :website => {"url" => "http://kotaku.com/"}
    end

    context "when the snippet saves successfully" do

      before do
        allow(website).to receive(:save).and_return(true)
      end

      it "redirects to the Website new" do
        post :create, :website => { "url" => "http://kotaku.com/" }
        expect(response).to redirect_to(new_website_path)
      end

    end

    context "when the website fails to save" do

      before do
        allow(website).to receive(:save).and_return(false)
      end

      it "renders the new template" do
        post :create, :website => { "title" => "placeholder title" }
        expect(response).to render_template("index")
      end

    end
  end

  describe "GET show" do
    login_user

    before do
      allow(Website).to receive(:find).and_return(website)
    end

    it "responds successfully" do
      get :show, :id => 1
      expect(response).to be_success
    end

    it "renders the show template" do
      get :show, :id => 1
      expect(response).to render_template("show")
    end
  end

  describe "GET index" do
    login_user

    it "responds successfully" do
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
