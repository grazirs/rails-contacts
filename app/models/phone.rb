class Phone < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true, format: { with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ }
  validate :validate_phone_type
  validates :main_phone, inclusion: [true, false]

  private

  def validate_phone_type
    if !phone_type.match(/^home$|^work$|^other$/)
    errors.add(:phone_type, "Invalid phone type")
    end
  end
end
