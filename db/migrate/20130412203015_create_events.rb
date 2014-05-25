class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :location
      t.integer :no_of_participants
      t.float :cost
      t.integer :trainer_id
      t.integer :training_content_id
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :all_day, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end