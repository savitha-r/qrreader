class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.attachment :logo
      t.boolean :verified, :default => false
      t.boolean :banned, :default => false
      t.boolean :published, :default => false
      t.string :email
      t.string :address
      t.string :fax
      t.string :phone

      t.timestamps
    end
  end
end
