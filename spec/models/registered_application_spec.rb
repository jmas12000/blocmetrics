require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
	let(:user) { User.create!(email: "jeff@example.com", username: "Jeff", password: "helloworld") }
	let(:registeredapp) { RegisteredApplication.create!(name: "Registered App Example", url: "www.myregisteredapplication.com", user: user) }

	describe "attributes" do
		it "has name, url, and user attributes" do
			expect(registeredapp).to have_attributes(name: "Registered App Example", url: "www.myregisteredapplication.com", user: user)
		end
	end
end