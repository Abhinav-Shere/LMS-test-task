class AddForeignKeyToLessons < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :lessons, :courses, column: :course_id
    add_index :lessons, :course_id
  end
end
