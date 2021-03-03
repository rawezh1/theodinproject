class AddIdentifierUuid < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :indentifier_uuid, :string, null: false, default: ""
    add_column :sections, :indentifier_uuid, :string, null: false, default: ""
    add_column :courses, :indentifier_uuid, :string, null: false, default: ""
    add_column :paths, :indentifier_uuid, :string, null: false, default: ""

    add_index :lessons, :indentifier_uuid
    add_index :sections, :indentifier_uuid
    add_index :courses, :indentifier_uuid
    add_index :paths, :indentifier_uuid
  end
end
