class MedicamentGroupSubstance < ApplicationRecord
  belongs_to :substance
  belongs_to :medicament_group
end
