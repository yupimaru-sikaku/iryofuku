class CreateIryoes < ActiveRecord::Migration[6.0]
  def change
    create_table :iryoes do |t|

      t.timestamps
    end
  end
end
