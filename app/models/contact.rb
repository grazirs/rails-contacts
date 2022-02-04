class Contact < ApplicationRecord
  belongs_to :user
  has_many :phones

  validates :name, presence: true, uniqueness: { scope: :user}
  validate :validate_birth_date

  private

  def validate_birth_date
    if !birth_date.respond_to?(:strftime)
      errors.add(:birth_date, "Invalid date format!")
    end 
  end
end
