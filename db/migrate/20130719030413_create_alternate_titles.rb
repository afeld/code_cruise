class CreateAlternateTitles < ActiveRecord::Migration
  def change
    create_table :alternate_titles do |t|
      t.string :title
      t.integer :topic_id

      t.timestamps
    end
  end
end
