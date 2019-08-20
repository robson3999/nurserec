class CreateMedicaments < ActiveRecord::Migration[5.2]
  def change
    create_table :medicaments do |t|
      t.string :name
      t.integer :status, default: 0
      t.jsonb :data

      t.timestamps
    end
  end
end
