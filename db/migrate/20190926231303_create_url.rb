class CreateUrl < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :description, null: false
      t.string :long, null: false
      t.string :short, null: false
      t.string :color, null: false
      t.integer :clicks_count
      t.timestamps
    end

    add_index :urls, :short, unique: true
  end
end
