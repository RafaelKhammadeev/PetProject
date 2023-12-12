require "rails_helper"

describe Feedback do
  let(:feedback) { build :feedback, title:, message: }
  let(:title) { "Title" }
  let(:message) { "Write some message" }

  describe "#valid?" do
    subject { feedback.valid? }

    it { is_expected.to be_truthy }

    context "when feedback doesn't have title" do
      let(:title) { nil }

      it { is_expected.to be_falsey }
    end

    context "when feedback doesn't have message" do
      let(:message) { nil }

      it { is_expected.to be_falsey }
    end

    context "when title have more 100's symbols" do
      let(:title) { Faker::Alphanumeric.alpha(number: 101) }

      it { is_expected.to be_falsey }
    end

    context "when message have more 500's symbols" do
      let(:message) { Faker::Alphanumeric.alpha(number: 501) }

      it { is_expected.to be_falsey }
    end
  end
end
