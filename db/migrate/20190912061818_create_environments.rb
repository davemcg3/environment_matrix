class CreateEnvironments < ActiveRecord::Migration[6.0]
  def change
    create_table :environments do |t|
      t.string :name
      t.integer :status
      t.references :projects, null: false, foreign_key: true

      t.timestamps
    end
  end
end
