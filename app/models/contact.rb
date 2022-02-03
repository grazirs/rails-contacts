class Contact < ApplicationRecord
  belongs_to :user
  has_many :phones

  validates :name, presence: true
  validates :birth_date, format: { with: /^\d{2}\/\d{2}\/\d{4}$/ }
  validate :validate_unique_name

  private

  def validate_unique_name
    contact = Contact.find_by(user_id: user_id, name: name)
    if contact != nil
      errors.add(:name, "Name already exists!")
    end
  end
end
