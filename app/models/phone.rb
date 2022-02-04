class Phone < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true, format: { with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ },  uniqueness: { scope: :contact_id }
  validates :phone_type, inclusion: ['home', 'work', 'other'], presence: true
  validates :main_phone, inclusion: [true, false], presence: true, uniqueness: { scope: :contact_id, conditions: -> { where(main_phone: true) } }
end
