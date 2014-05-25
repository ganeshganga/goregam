class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :contact
      t.string :website
      t.string :facebook_site
      t.integer :rating
      t.text :specialities
      t.string :home_town
      t.text :products
      t.text :qualifications
      t.string :image         
      t.timestamps
    end
  end
end