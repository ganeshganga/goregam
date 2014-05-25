class AddNameToTrainingContents < ActiveRecord::Migration
  def change
    add_column :training_contents, :name, :string
  end
end
