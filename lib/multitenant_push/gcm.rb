require "pushmeup"
GCM2 = GCM.clone

module MultitenantPush
  module GCM
    include GCM2

    def self.send_notification( device_tokens, data)
      self.load_credentials()
      GCM2.send_notification( device_tokens, data)
    end

    def self.methods
      GCM2.methods
    end
    
    def self.method_missing(method, *args, &block)
      GCM2.send method, *args
    end


    def self.load_credentials
      raise NoTenant if Tenant.current_tenant.nil?
      credentials = Credential.first
      raise NoTenantCredentials if credentials.nil? || credentials.gcm_host.blank? || credentials.gcm_key.blank?

      GCM.host = credentials.gcm_host
      GCM.key = credentials.gcm_key

    end

    

  end

end