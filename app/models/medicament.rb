class Medicament < ApplicationRecord
  has_many :medicament_medicament_groups
  has_many :medicament_groups, through: :medicament_medicament_groups
  has_many :medicament_substances
  has_many :substances, through: :medicament_substances
  jsonb_accessor :data,
    way_of_application: :string,
    description: :string

  enum status: %i[ordinable pursued]

  validates :name, presence: true
  validates :status, presence: true
end
