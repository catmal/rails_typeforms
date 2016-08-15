class CreateTypeforms < ActiveRecord::Migration
  def self.up
    create_table :typeforms do |t|
      t.string :name
      t.string :typeform_uid
      t.timestamps
    end
  end

  def self.down
    drop_table :typeforms
  end
end