class CreateAuthzs < ActiveRecord::Migration[7.0]
  def change
    create_table :authzs do |t|
      t.string :access_token
      t.string :refresh_token
      t.integer :expires_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
