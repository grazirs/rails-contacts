class Phone < ApplicationRecord
  belongs_to :contact
  before_save :update_existing_main_phone

  validates :number, presence: true, format: { with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ },  uniqueness: { scope: :contact_id }
  validates :phone_type, inclusion: ['home', 'work', 'other'], presence: true
  validates :main_phone, inclusion: { in: [true, false] }

  private

  def update_existing_main_phone
    if main_phone == true
      existing_main_phone = Phone.find_by(contact_id: contact_id, main_phone: true)
      if existing_main_phone != nil
        existing_main_phone.update!(main_phone: false)
      end
    end
  end
end
