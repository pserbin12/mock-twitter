class CreateToots < ActiveRecord::Migration[5.1]
  def change
    create_table :toots do |t|
      t.text :message
      t.integer :user_id

      t.timestamps
    end
  end
end
