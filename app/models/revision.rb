class Revision < ApplicationRecord
  belongs_to :wiki
  
  # Nomenclature date-number
  def create_nomenclature
    number = number.nil? ? 0 : number + 1
    nomenclature = updated_at + "-" + number
    self.save
  end
end
