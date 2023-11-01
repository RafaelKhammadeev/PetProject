require 'rails_helper'

describe User do
  it 'valid user' do
    expect(build(:user)).to be_valid
  end

  describe '#invalid user' do
    it 'without a name' do
      expect(build(:user, name: '')).to_not be_valid
    end

    it 'without a surname' do
      expect(build(:user, surname: '')).to_not be_valid
    end
  end
end
