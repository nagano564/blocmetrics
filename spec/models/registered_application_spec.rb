require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do

  let(:registered_application) { RegisteredApplication.create!(name: "New app name", URL: "www.espn.com") }

  describe "attributes" do
    it "has name and URL attributes" do
      expect(registered_application).to have_attributes(name: "New app name", URL: "www.espn.com")
    end
  end
end
