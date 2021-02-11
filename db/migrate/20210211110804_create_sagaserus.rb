class CreateSagaserus < ActiveRecord::Migration[6.0]
  def change
    create_table :sagaserus do |t|

      t.timestamps
    end
  end
end
