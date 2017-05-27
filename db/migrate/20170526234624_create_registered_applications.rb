class CreateRegisteredApplications < ActiveRecord::Migration
  def change
    create_table :registered_applications do |t|
      t.string :name, null: false
      t.string :url, null: false

      t.timestamps null: false
    end
  end
end
