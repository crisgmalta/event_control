class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
