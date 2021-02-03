class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :user_id
      t.datetime :date
      t.string :subject
      t.string :note
      t.string :assignment
    end
  end
end
