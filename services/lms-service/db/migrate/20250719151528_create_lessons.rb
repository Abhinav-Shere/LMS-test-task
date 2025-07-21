class CreateLessons < ActiveRecord::Migration[8.0]
  def change
    create_table :lessons, id: :uuid do |t|
      t.uuid :aggregate_id, null: false
      t.uuid :course_id, null: false
      t.string :title
      t.text :content
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end
