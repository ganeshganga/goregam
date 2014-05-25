class CreateTrainingContents < ActiveRecord::Migration
  def change
    create_table :training_contents do |t|     
      t.text :description      
      t.text :preconditions      
      t.text :included_material
      t.text :necessary_material
      t.float :cost
      t.boolean :model_needed
      t.integer :max_participants
      t.text :included_services
      t.text :comments
      t.string :level
      t.timestamps
    end
  end
end