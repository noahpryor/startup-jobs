class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :url
      t.integer :company_id
      t.datetime :date_posted
      t.datetime :dated_updated
      t.integer :technical
      t.integer :internship

      t.timestamps
    end
  end
end
