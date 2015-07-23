require 'rails_helper'
require 'spec_helper'

describe ContentExtractor do
   describe ".extract" do
    it "should return splited content" do
      test_content = ContentExtractor.new(url)
      expect(test_content.extract).to eql(content)
    end
  end
end

def url
  "http://localhost:3000"
end

def content
  ["Login"]
end
