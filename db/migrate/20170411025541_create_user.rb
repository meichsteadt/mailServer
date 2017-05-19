class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :key
      t.string :password_hash

      t.timestamps
    end
  end
end
