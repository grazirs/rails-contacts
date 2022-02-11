require 'rails_helper'

RSpec.describe Phone, type: :model do
  fixtures :phones

  describe "phones validations " do
    it 'create a valid phone' do
      phone = Phone.new(number: '1234567889', phone_type: 'home', main_phone: true, contact_id:1)
      expect(phone).to be_valid
    end
    it "should not create a phone without number" do
      phone = Phone.new(phone_type: 'home', main_phone: true, contact_id:1)
      expect(phone).not_to be_valid
    end

    it 'should not create a phone without a phone type' do
      phone = Phone.new(number: '1234567889', main_phone: true, contact_id:1)
      expect(phone).not_to be_valid
    end

    it 'should not create a phone without a main phone' do
      phone = Phone.new(number: '1234567889', phone_type: 'home', contact_id:1)
      expect(phone).not_to be_valid
    end
  end

  describe "two phones with the same data" do
    it 'should not create a new phone' do
      expect { Phone.create!(number: '1234567899', phone_type: 'home', main_phone: false, contact_id: 1  ) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  describe "add a main phone" do
    it "should update an existing main phone" do
      phone1 = Phone.create!(number: '1233567889', phone_type: 'home', main_phone: true, contact_id:1)
      phone2 = Phone.create!(number: '4563567889', phone_type: 'home', main_phone: true, contact_id:1)
      main_phones = Phone.where(main_phone: true)
      expect(main_phones.size).to eq(1)
    end
  end
end
