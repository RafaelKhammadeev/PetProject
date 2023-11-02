require 'rails_helper'

describe Feedback do
  it 'valid feedback' do
    expect(binding.pry)
    expect(build(:feedback)).to be_valid
  end

  describe '#ivalid feedback' do
    it 'without a title' do
      expect(build(:feedback, title: '')).to_not be_valid
    end

    it 'without a message' do
      expect(build(:feedback, message: '')).to_not be_valid
    end
  end
end
