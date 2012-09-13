class AddCrunchbaseSlugToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :crunchbase_slug, :string
  end
end
