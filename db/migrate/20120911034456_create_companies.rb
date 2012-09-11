class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, :string
      t.string :url, :text
      t.string :jobs_url, :text
      t.string :description, :text
      t.string :founded, :text
      t.string :employees, :integer
      t.string :funding, :float
      t.string :location, :text
      t.string :category, :text

      t.timestamps
    end
  end
end
