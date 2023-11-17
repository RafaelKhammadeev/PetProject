require "rails_helper"

describe User do
  let(:user) { build :user, name:, surname:, role:}
  let(:name) { "John" }
  let(:surname) { "Johns" }
  let(:role) { "user" }

  describe "#valid?" do
    subject { user.valid? }

    it { is_expected.to be_truthy }
  end

  context "wnen user has a nil name" do
    let(:name) { nil }

    it { expect(user).to be_invalid }
  end

  context "wnen user has a nil surname" do
    let(:surname) { nil }

    it { expect(user).to be_invalid }
  end

  context "when user have admin role" do
    let(:role) { "admin" }

    it { expect(user).to be_admin }
  end

  context "when user have user role" do
    it { expect(user).to be_user }
  end
end
