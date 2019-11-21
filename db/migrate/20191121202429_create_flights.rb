class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :user_id
      t.string :description
      t.datetime :departs_at
      t.boolean :message_sent

      t.timestamps
    end
  end
end
