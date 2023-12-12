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
  end
end
