class Substance < ApplicationRecord
  has_many :medicament_substances
  has_many :medicaments, through: :medicament_substances

  has_many :medicament_group_substances
  has_many :medicament_groups, through: :medicament_group_substances
end
