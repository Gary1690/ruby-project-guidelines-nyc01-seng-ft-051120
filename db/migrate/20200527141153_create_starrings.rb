class CreateStarrings < ActiveRecord::Migration[5.0]
  def change
    create_table :starrings do |t|
      t.integer :actor_id 
      t.integer :show_id
    end
  end
end
