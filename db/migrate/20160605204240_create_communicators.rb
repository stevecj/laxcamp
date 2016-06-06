class CreateCommunicators < ActiveRecord::Migration[5.0]
  def change
    create_table :communicators do |t|
      t.string :handle
      t.string :full_name

      t.timestamps
    end
    add_index :communicators, :handle, unique: true
  end
end
