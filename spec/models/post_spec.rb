require "rails_helper"

describe Post do
  let(:post) { build :post, title:, description: }
  let(:title) { "Title" }
  let(:description) { "Description" }

  describe "#valid?" do
    subject { post.valid? }

    it { is_expected.to be_truthy }

    context "when post doesn't have title" do
      let(:title) { nil }

      it { is_expected.to be_falsey }
    end

    context "when post doesn't have description" do
      let(:description) { nil }

      it { is_expected.to be_falsey }
    end

    context "when description is less than 10 characters" do
      let(:description) { "5char" }

      it { is_expected.to be_falsey }
    end
  end
end
