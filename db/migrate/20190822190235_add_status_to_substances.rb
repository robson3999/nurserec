class AddStatusToSubstances < ActiveRecord::Migration[5.2]
  def change
    add_column :substances, :status, :integer, default: 0
  end
end
