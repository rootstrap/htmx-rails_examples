class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :first_name, required: true
      t.string :last_name, required: true
      t.string :email, required: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
