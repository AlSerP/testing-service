class CreateSolutions < ActiveRecord::Migration[7.1]
  def change
    create_table :solutions do |t|
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
