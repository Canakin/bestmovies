class CreateDirectors < ActiveRecord::Migration[6.0]
  def change
    create_table :directors do |t|
      t.string :fullname
      t.integer :birthyear
      t.text :minibio
      t.string :nationality
      t.text :top_movies
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
