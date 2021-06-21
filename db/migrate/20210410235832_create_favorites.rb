class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :iryo         , foreign_key: true, null: false
      t.references :company      , foreign_key: true, null: false
      t.string     :is_contracted, null: false, default: "未"

      t.timestamps

    end
  end
end