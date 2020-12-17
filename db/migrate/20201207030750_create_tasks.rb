class CreateTasks < ActiveRecord::Migration[6.0]
  def up
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.decimal :latitude
      t.decimal :longitude
      t.string :task_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
end
