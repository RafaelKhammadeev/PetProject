require 'rails_helper'

describe User do
  let(:user) { build :user, name: name, surname: surname }
  let(:name) { "John" }
  let(:surname) { "Johns" }

  it 'valid user' do
    expect(build(:user)).to be_valid
  end

  describe '#valid?' do
    context "without name" do
      let(:name) { nil }
      it 'try to build user' do
        expect(user.valid?).to_be falsey
      end
    end

    it 'without a surname' do
      expect(build(:user, surname: '')).to_not be_valid
    end
  end

  describe '#check role' do
    it 'admin' do
      expect(build(:user, :role_admin)).to be_admin
    end

    it 'user' do
      expect(build(:user, :role_user)).to be_user
    end
  end
end
