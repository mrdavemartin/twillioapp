class AppConfig < ActiveRecord::Migration
  def change
    create_table :app_configs do |t|
      t.string :name
      t.string :yammer_auth_token
      t.string :yammer_client_code
      t.string :yammer_client_secret
      t.timestamps
    end
  end
end
