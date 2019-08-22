class Medicament < ApplicationRecord
  has_many :medicament_medicament_groups, dependent: :destroy
  has_many :medicament_groups, through: :medicament_medicament_groups
  has_many :medicament_substances, dependent: :destroy
  has_many :substances, through: :medicament_substances
  jsonb_accessor :data,
    description: :string, # postac i dawka, zawartosc opakowania
    container: :string,
    decision_created_at: :string,
    decision_period: :string,
    limit_group: :string,
    gov_price: :string,
    gross_price: :string,
    finance_limit: :string,
    attachment_with_indication_name: :string,
    payment_level: :string,
    additional_payment: :string

  enum status: %i[ordinable pursued]

  validates :name, presence: true
  validates :status, presence: true
end
