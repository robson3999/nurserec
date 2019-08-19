class MedicamentMedicamentGroup < ApplicationRecord
  belongs_to :medicament
  belongs_to :medicament_group
end
