class CreateAreas < ActiveRecord::Migration[5.2]
  def up
    create_table :areas do |t|
      t.string :name
      t.text   :description

      t.timestamps
    end
  end

  def down
    drop_table :areas
  end
end
