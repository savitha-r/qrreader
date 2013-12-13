class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
      t.string :office_phone
      t.string :fax
      t.string :title
      t.string :description
      t.attachment :photo
      t.text :urls
      t.integer :company_id

      t.timestamps
    end
  end
end
