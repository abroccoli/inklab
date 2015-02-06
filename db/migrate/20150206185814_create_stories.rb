class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :stories, :users
  end
end
