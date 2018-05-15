require 'rails_helper'

RSpec.describe MemorialNotice, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'attributes' do
    it 'should have all the attributes we expect' do
      create(:memorial_notice)
      expect(MemorialNotice.first.first_name).to eq("Joe")
      expect(MemorialNotice.first.date_of_death).to eq("24/04/2016")
      expect(MemorialNotice.first.grandchild5).to eq(nil)
      expect(MemorialNotice.first.user.email).to eq("sami@sami.com")
    end

    it 'should default attributes we dont assign to nil' do
      create(:user)
      MemorialNotice.create!(first_name: "Jamie", last_name: "Parkins", date_of_death: "01/01/2015", after_nightfall: true, user_id: 1)
      expect(MemorialNotice.first.first_name).to eq("Jamie")
      expect(MemorialNotice.first.date_of_death).to eq("01/01/2015")
      expect(MemorialNotice.first.grandchild5).to eq(nil)
      expect(MemorialNotice.first.child7).to eq(nil)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:date_of_death) }
    it { should validate_presence_of(:user_id) }
    
    it { should validate_inclusion_of(:after_nightfall).in_array([true, false]) }
  end

  describe 'before_save action' do
    it 'capitalizes the first name before database save' do
      create(:memorial_notice, first_name: "jenny")
      expect(MemorialNotice.first.first_name).to eq("Jenny")
    end
    it 'capitalizes the last name before database save' do
      create(:memorial_notice, last_name: "blogg")
      expect(MemorialNotice.first.last_name).to eq("Blogg")
    end
  end
end
