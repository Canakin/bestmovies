class RenameTypeToCatego < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :type, :catego
  end
end
