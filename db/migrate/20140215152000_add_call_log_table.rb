class AddCallLogTable < ActiveRecord::Migration
  def change
   add_column :app_configs, :twilio_sid, :string
   
   create_table :message_logs do |t|
     t.string :from
     t.string :country
     t.string :state
     t.string :call_sid
     t.string :menu_digit
     t.string :recording_url
     t.string :app_config_id
     t.string :recording_sid
     t.timestamps
   end
   
  end
end
