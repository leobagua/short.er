class CreateClick < ActiveRecord::Migration[5.2]
  def change
    create_table :clicks do |t|
      t.string :ip
      t.string :country
      t.date :date
      t.timestamps

      t.references :url, index: true, null: false
      t.foreign_key :urls
    end

    add_index :clicks, [:country]
    add_index :clicks, [:country, :url_id]
  end
end
