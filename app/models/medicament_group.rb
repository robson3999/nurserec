class MedicamentGroup < ApplicationRecord
  has_many :medicament_medicament_groups
  has_many :medicaments, through: :medicament_medicament_groups
  validates :name, presence: true
end
