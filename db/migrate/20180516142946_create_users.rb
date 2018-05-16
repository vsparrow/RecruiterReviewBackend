class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.boolean :scrambleview

      t.timestamps
    end
  end
end
