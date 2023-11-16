require 'rails_helper'

describe User do
  let(:user) { build :user, name: name, surname: surname }
  let(:name) { "John" }
  let(:surname) { "Johns" }
  let(:role) { "user" } 

  describe '#valid?' do
    subject { user.valid? }

    it { is_expected.to be_truthy }
  end

  context "wnen user has a nil name" do
    let(:name) { nil }

    it 'validates' 
      expect(user).to_not be_valid
    end
  end

  context "wnen user has a nil surname" do
    let(:surname) { nil }

    it 'validates' do
      expect(user).to_not be_valid
    end
  end

  context 'when user have admin role' do
    let(:role) { "admin" }

    it 'admin' do
      expect(user).to be_admin
    end
  end

  context 'when user have user role' do
    it 'user' do
      expect(user).to be_user
    end
  end
end
