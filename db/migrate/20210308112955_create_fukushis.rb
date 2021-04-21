class CreateFukushis < ActiveRecord::Migration[6.0]
  def change
    create_table :fukushis do |t|

      t.integer    :age               , null: false
      t.string     :classification_id , null: false
      t.string     :disability_type_id, null: false
      t.string     :osaka_city_id     , null: false
      t.string     :prefecture_id     , null: false
      t.string     :service_type_id   , null: false
      t.string     :sex_id            , null: false
      t.references :user              , foreign_key: true

      t.timestamps
    end
  end
end
