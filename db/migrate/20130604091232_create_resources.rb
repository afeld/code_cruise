class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :url
      t.integer :topic_id

      t.timestamps
    end
  end
end
