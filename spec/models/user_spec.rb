require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'attribures' do
    it 'has attributes password and email' do
      expect(user).to have_attributes(email: "sami@sami.com")
    end
  end
end
