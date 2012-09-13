class AddIdsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :image, :string
    add_column :companies, :deadpooled_url, :string
    add_column :companies, :funding_rounds, :integer
    add_column :companies, :overview, :text
    add_column :companies, :twitter_username, :string
    add_column :companies, :blog_url, :string
   

  end
end
