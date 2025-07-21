class CreateSequentSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :event_records do |t|
      t.string   :aggregate_id, null: false
      t.integer  :sequence_number, null: false
      t.string   :event_type, null: false
      t.text     :event_json, null: false
      t.string   :created_by
      t.datetime :created_at, null: false
    end
    add_index :event_records, [:aggregate_id, :sequence_number], unique: true

    create_table :stream_records do |t|
      t.string   :aggregate_type, null: false
      t.string   :aggregate_id, null: false
      t.integer  :snapshot_threshold, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :stream_records, [:aggregate_type, :aggregate_id], unique: true

    create_table :snapshot_records do |t|
      t.string   :aggregate_id, null: false
      t.integer  :sequence_number, null: false
      t.text     :snapshot, null: false
      t.datetime :created_at, null: false
    end
    add_index :snapshot_records, [:aggregate_id, :sequence_number], unique: true
  end
end
