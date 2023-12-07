require "rails_helper"

describe Feedback do
  let(:feedback) { build :feedback, title:, message: }
  let(:title) { "Title" }
  let(:message) { "Write some message" }

  describe "#valid?" do
    subject { feedback.valid? }

    it { is_expected.to be_truthy }
  end

  context "when feedback doesn't have title" do
    let(:title) { nil }

    it { expect(feedback).to be_invalid }
  end

  context "wnen feedback doesn't have message" do
    let(:message) { nil }

    it { expect(feedback).to be_invalid }
  end
end
