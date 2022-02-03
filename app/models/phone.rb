class Phone < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true, format: { with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ }
  validates :phone_type, inclusion: ['home', 'work', 'other'], presence: true
  validates :main_phone, inclusion: [true, false], presence: true

  private

  def validate_unique_phone
    phone= Phone.find_by(contact_id: contact_id, number: number, phone_type: phone_type, main_phone: main_phone)
    if phone != nil
      errors.add(:name, "This phone already exists for this contact!")
    end
  end

end
