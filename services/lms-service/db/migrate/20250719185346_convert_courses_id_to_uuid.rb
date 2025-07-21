class ConvertCoursesIdToUuid < ActiveRecord::Migration[8.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    # Create a new table with UUID
    create_table :courses_new, id: :uuid do |t|
      t.string :name
      t.timestamps
    end

    # Copy old data (if any)
    execute <<-SQL
      INSERT INTO courses_new (id, name, created_at, updated_at)
      SELECT gen_random_uuid(), name, created_at, updated_at FROM courses;
    SQL
    # Drop old table and rename new one
    drop_table :courses
    rename_table :courses_new, :courses
  end
end
