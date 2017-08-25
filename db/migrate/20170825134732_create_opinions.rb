class CreateOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :opinions do |t|
      t.string :name
      t.string :surname
      t.integer :rate
      t.text :text
      t.references :film, foreign_key: true
      t.timestamps
    end
  end
end
