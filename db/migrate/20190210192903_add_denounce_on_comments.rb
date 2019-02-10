class AddDenounceOnComments < ActiveRecord::Migration[5.2]
  def up
    add_column :comments, :denounce, :boolean, default: false
  end

  def down
    remove_column :comments, :denounce, :boolean
  end
end
