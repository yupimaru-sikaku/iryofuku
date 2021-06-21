class CreateIryos < ActiveRecord::Migration[6.0]
  def change
    create_table :iryos do |t|

      t.integer    :age                , null: false
      t.string     :classification_id  , null: false
      t.string     :disability_type_id , null: false
      t.string     :prefecture_id      , null: false
      t.text       :city_ids
      t.string     :ward_id 
      t.string     :service_type_id    , null: false
      t.string     :sex_id             , null: false
      t.references :user               , foreign_key: true
      t.string     :is_contracted      , null: false      , default: "未"

      t.timestamps
    end
  end
end
