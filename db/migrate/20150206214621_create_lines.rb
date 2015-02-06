class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :content
      t.belongs_to :story, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :lines, :stories
    add_foreign_key :lines, :users
  end
end
