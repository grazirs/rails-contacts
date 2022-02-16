class User < ApplicationRecord
  has_many :contacts

  validates :name, presence: true, uniqueness: true
  validates :age, numericality: { only_integer: true, allow_nil: true }
  validates :bio, length: { in: 10..500 }

  def total_phones
    phones = 0
    contacts.each do |contact|
      phones += contact.phones.count 
    end
    phones
  end
end
