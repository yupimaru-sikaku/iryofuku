class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :fukushi, foreign_key: true, null: false
      t.references :company, foreign_key: true, null: false
      
      t.timestamps

    end
  end
end