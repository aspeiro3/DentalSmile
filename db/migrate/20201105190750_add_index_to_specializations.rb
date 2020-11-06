class AddIndexToSpecializations < ActiveRecord::Migration[6.0]
  def change
    add_index :specializations, :title, unique: true
  end
end
