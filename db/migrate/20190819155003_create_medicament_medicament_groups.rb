class CreateMedicamentMedicamentGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :medicament_medicament_groups do |t|
      t.references :medicament, foreign_key: true
      t.references :medicament_group, foreign_key: true

      t.timestamps
    end
  end
end
