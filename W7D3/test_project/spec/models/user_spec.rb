require "rails_helper"

# validations, associations, 
# class scope methods (e.g. User::find_by_credentials)
# validations: shoulda-matchers

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "::find_by_credentials"  do
    it "should find a user by their email and password" do
      user = User.create!(email: "a@b.com", password: "abcfwafwafa")
      expect(User.find_by_credentials("a@b.com", "abcfwafwafa")).to eq(user)
    end
  end
end