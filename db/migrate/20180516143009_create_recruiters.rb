class CreateRecruiters < ActiveRecord::Migration[5.1]
  def change
    create_table :recruiters do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phonenumber
      t.boolean :is_generated
      t.string :website
      t.string :company
      t.string :linkedin
      t.string :location

      t.timestamps
    end
  end
end
