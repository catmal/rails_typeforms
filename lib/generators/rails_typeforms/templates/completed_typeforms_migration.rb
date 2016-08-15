class CreateCompletedTypeforms < ActiveRecord::Migration
  def self.up
    create_table :completed_typeforms do |t|
      t.integer :typeform_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :completed_typeforms
  end
end