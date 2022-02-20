require 'rails_helper'

RSpec.describe Contact, type: :model do
  fixtures :contacts

  describe "contacts validations " do
    it 'create a valid contact' do
      user1 = User.find_by(id: 1)
      contact = Contact.new(name: 'contact1', birth_date:'22/11/1111', user_id: 1)
      expect(contact).to be_valid
    end
    it "should not create a contact without name" do
      contact = Contact.new( birth_date:'22/11/1111', user_id: 1)
      expect(contact).not_to be_valid
    end

    it 'should not create a contact with invalid birth date' do
      contact = Contact.new(name: 'contact1', birth_date:'x', user_id: 1)
      expect(contact).not_to be_valid
    end
  end

  describe "two contacts with the same name and same user" do
    it 'should not create a new contact' do
      user1 = User.find_by(id: 1)

      expect {
        Contact.create name: 'Maëlie', user: user1, birth_date:'22/11/1111'
        Contact.create name: 'Maëlie', user: user1, birth_date:'22/11/2222'
      }.to change(Contact, :count).by(1)
    end
  end

end
