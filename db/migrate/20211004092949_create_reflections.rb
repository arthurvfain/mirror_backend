class CreateReflections < ActiveRecord::Migration[6.1]
  def change
    create_table :reflections do |t|
      t.integer :user_id
      t.integer :mirror_id
      t.integer :o
      t.integer :c
      t.integer :e
      t.integer :a
      t.integer :n

      t.timestamps
    end
  end
end
