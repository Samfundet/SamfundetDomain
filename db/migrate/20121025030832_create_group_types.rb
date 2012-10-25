class CreateGroupTypes < ActiveRecord::Migration
  def up
    create_table :group_types do |t|
      t.string  :description, :null => false
      t.integer :priority, :null => false, :default => 0

      t.timestamps
    end
  end

  def down
    drop_table :group_types
  end
end
