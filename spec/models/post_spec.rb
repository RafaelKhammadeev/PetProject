require "rails_helper"

describe Post do
  let(:post) { build :post, title:, description: }
  let(:title) { "Title" }
  let(:description) { "Description" }

  describe "#valid?" do
    subject { post.valid? }

    it { is_expected.to be_truthy }
  end

  context "when post doesn't have title" do
    let(:title) { nil }

    it { expect(post).to be_invalid }
  end

  context "when post doesn't have description" do
    let(:description) { nil }

    it { expect(post).to be_invalid }
  end

  context "when description is less than 10 characters" do
    let(:description) { "5char" }

    it { expect(post).to be_invalid }
  end
end
