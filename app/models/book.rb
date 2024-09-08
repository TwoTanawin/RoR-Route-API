class Book < ApplicationRecord
  validates :name, presence: true

  def id_and_name
    "#{self.id} #{self.name}"
  end
  def as_api_json
    json = {}
    json[:id_and_name] = self.id_and_name
    json[:id] = self.id
    json[:name] = self.name
    json
  end
end
