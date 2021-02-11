class CreateKuraserus < ActiveRecord::Migration[6.0]
  def change
    create_table :kuraserus do |t|

      t.timestamps
    end
  end
end
