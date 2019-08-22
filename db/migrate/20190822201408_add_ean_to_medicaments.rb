class AddEanToMedicaments < ActiveRecord::Migration[5.2]
  def change
    add_column :medicaments, :ean, :string
    add_index :medicaments, :ean
  end
end
