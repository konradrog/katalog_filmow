class CreateFilms < ActiveRecord::Migration[5.1]
  def change
    create_table :films do |t|
      t.string :title
      t.date :premiere
      t.integer :length
      t.text :description
      t.string :director
      t.string :country
      t.string :category
      t.string :screen_writer

      t.timestamps
    end
  end
end
