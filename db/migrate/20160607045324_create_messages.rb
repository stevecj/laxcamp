class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :communicator_id
      t.text :content

      t.timestamps
    end
    add_index :messages, :communicator_id
  end
end
