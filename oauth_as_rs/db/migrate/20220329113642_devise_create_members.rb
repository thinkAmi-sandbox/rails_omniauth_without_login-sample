# frozen_string_literal: true

class DeviseCreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.timestamps null: false
    end

    add_index :members, :email,                unique: true
  end
end
