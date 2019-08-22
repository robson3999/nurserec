class MedicamentGroup < ApplicationRecord
  has_many :medicament_medicament_groups, dependent: :destroy
  has_many :medicaments, through: :medicament_medicament_groups
  validates :name, presence: true
end
