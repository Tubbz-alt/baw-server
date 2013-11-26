class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, :null => false
      t.text :description
      t.string :urn
      t.text :notes
      t.integer :creator_id, :null => false
      t.integer :updater_id
      t.integer :deleter_id
      t.datetime :deleted_at
      t.attachment :image

      t.timestamps
    end
  end
end
