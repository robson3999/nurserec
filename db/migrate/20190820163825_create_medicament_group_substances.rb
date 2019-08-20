class CreateMedicamentGroupSubstances < ActiveRecord::Migration[5.2]
  def change
    create_table :medicament_group_substances do |t|
      t.references :substance, foreign_key: true
      t.references :medicament_group, foreign_key: true

      t.timestamps
    end
  end
end
