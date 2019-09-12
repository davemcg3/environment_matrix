class CreateEnterprises < ActiveRecord::Migration[6.0]
  def change
    create_table :enterprises do |t|
      t.string :name
      t.integer :status
      t.references :environments, null: false, foreign_key: true
      t.references :services, null: false, foreign_key: true

      t.timestamps
    end
  end
end
