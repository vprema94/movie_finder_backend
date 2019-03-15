class AddPosterToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :poster, :string
  end
end
