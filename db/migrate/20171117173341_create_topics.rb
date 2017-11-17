class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics, id: false do |t|
      t.string :name, limit: 255, null: false
      t.string :urls
      t.timestamps
    end

    add_index :topics, :name, unique: true
  end
end
