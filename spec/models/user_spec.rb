require "rails_helper"

describe User do
  let(:user) { build :user, name:, surname:, role: }
  let(:name) { "John" }
  let(:surname) { "Johns" }
  let(:role) { "user" }

  describe "#valid?" do
    subject { user.valid? }

    context "when valid user" do
      it { is_expected.to be_truthy }
    end

    context "when user has a nil name" do
      let(:name) { nil }

      it { is_expected.to be_falsey }
    end

    context "when user has a nil surname" do
      let(:surname) { nil }

      it { is_expected.to be_falsey }
    end
  end
end
