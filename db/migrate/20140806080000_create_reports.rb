class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :width
      t.integer :height
      t.float :cost
      t.text :comment
      t.references :user, index: true

      t.timestamps
    end
  end
end
