require 'rails_helper'

describe Feedback do
  build(:feedback)


  it 'feedback valid' do
    expect(create(:feedback)).to be_valid
  end

  context 'wnen feedback invalid' do
    it 'without a title' do
      expect(create(:feedback, title: '')).to be_invalid
    end

    it 'without a message' do
      expect(create(:feedback, message: '')).to_not be_valid
    end
  end
end
