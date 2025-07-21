class CreateUserProgresses < ActiveRecord::Migration[8.0]
  def change
    create_table :user_progresses do |t|
      t.string :user_id
      t.string :course_id
      t.string :lesson_id
      t.boolean :completed

      t.timestamps
    end
  end
end
