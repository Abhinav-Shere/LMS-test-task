class CreateSequentSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :reco_event_records do |t|
      t.string :aggregate_id
      t.integer :sequence_number
      t.string :event_type
      t.text :event_json
      t.string :created_by
      t.datetime :created_at
    end
    add_index :reco_event_records, [:aggregate_id, :sequence_number], unique: true

    create_table :reco_stream_records do |t|
      t.string :aggregate_type
      t.string :aggregate_id
      t.integer :snapshot_threshold
      t.timestamps
    end
    add_index :reco_stream_records, [:aggregate_type, :aggregate_id], unique: true

    create_table :reco_snapshot_records do |t|
      t.string :aggregate_id
      t.integer :sequence_number
      t.text :snapshot
      t.timestamps
    end
    add_index :reco_snapshot_records, [:aggregate_id, :sequence_number], unique: true
  end
end
