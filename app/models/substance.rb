class Substance < ApplicationRecord
  has_many :medicament_substances
  has_many :medicaments, through: :medicament_substances
end
