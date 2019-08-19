class MedicamentSubstance < ApplicationRecord
  belongs_to :medicament
  belongs_to :substance
end
