class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :genre
      t.text :summary
      t.decimal :imdb_score
      t.string :type
      t.string :origin
      t.string :languange

      t.timestamps
    end
  end
end
