class CreateChats < ActiveRecord::Migration[6.0]
  def up
    create_table :chats do |t|
      t.references :user, index: true, null: false, foreign_key: true
      t.references :task, index: true, null: false, foreign_key: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :chats
  end
end
end
