require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'attribures' do
    it 'has attributes password and email' do
      expect(user).to have_attributes(email: "sami@sami.com")
    end
  end

  describe 'associations' do
    it { should have_many(:memorial_notices) }
  end
end
