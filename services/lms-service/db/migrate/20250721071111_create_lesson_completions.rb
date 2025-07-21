class CreateLessonCompletions < ActiveRecord::Migration[8.0]
  def change
    create_table :lesson_completions do |t|
      t.uuid :user_id
      t.uuid :lesson_id
      t.boolean :completed

      t.timestamps
    end
  end
end
