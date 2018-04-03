class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.string :client_id
      t.string :secret
      t.string :public_id

      t.timestamps
    end
  end
end
