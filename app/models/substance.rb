class Substance < ApplicationRecord
  has_many :medicament_substances, dependent: :destroy
  has_many :medicaments, through: :medicament_substances

  has_many :medicament_group_substances, dependent: :destroy
  has_many :medicament_groups, through: :medicament_group_substances
  
  enum status: %i[not_available ordinable pursued]
end
