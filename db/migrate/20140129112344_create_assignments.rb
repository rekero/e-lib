class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :author_id
	  t.integer :book_id
    end
	add_index :assignments, :author_id
	add_index :assignments, :book_id
  end
end
