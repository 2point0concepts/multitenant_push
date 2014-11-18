require "pushmeup"
GCM2 = GCM.clone

module MultitenantPush
  module GCM

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
      raise NoTenantCredentials if Tenant.current_tenant.nil?
      credentials = Credential.first
      raise NoTenant if credentials.nil? || credentials.gcm_host.blank? || credentials.gcm_key.blank?

      GCM.host = credentials.gcm_host
      GCM.pass = credentials.gcm_key
      GCM.pem = "lib/#{Tenant.current_tenant.name}.pem"

    end

    

  end

end