class CreateMedicamentSubstances < ActiveRecord::Migration[5.2]
  def change
    create_table :medicament_substances do |t|
      t.references :medicament, foreign_key: true
      t.references :substance, foreign_key: true

      t.timestamps
    end
  end
end
