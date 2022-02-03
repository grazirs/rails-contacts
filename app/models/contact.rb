class Contact < ApplicationRecord
  belongs_to :user
  has_many :phones

  validates :name, presence: true
  validate :validate_birth_date
  validate :validate_unique_contact

  private

  def validate_unique_contact
    contact = Contact.find_by(user_id: user_id, name: name)
    if contact != nil
      errors.add(:name, "Contact already exists for this user!")
    end
  end

  def validate_birth_date
    if !birth_date.respond_to?(:strftime)
      errors.add(:birth_date, "Invalid date format!")
    end 
  end
end
