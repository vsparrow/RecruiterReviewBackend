class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :recruiter_id
      t.string :review
      t.boolean :got_interview
      t.boolean :got_job
      t.integer :rating
      t.boolean :is_generated
      t.boolean :recommended
      t.boolean :ghoster

      t.timestamps
    end
  end
end
