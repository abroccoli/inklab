class AddEntriesToStories < ActiveRecord::Migration
  def change
    add_column :stories, :entries, :text
  end
end
