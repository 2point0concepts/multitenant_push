class CreateMultitenantPushCredentials < ActiveRecord::Migration
  def change
    create_table :multitenant_push_credentials do |t|
      t.references :tenant, index: true, null: false
      
      t.string :gcm_host
      t.string :gcm_key
      t.string :apns_host
      t.string :apns_pass


      t.timestamps
    end
  end
end
