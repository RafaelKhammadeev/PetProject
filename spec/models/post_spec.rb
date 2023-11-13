require 'rails_helper'

describe Post do
  it 'valid post' do
    expect(build(:post)).to be_valid
  end

  describe '#invalid post' do
    it 'without a title' do
      expect(build(:post, title: '')).to_not be_valid
    end

    it 'without a description' do
      expect(build(:post, description: '')).to_not be_valid
    end

    it 'description is less than 10 characters' do
      expect(build(:post, description: '5char')).to_not be_valid
    end
  end

  it 'check user relation existence'
end
