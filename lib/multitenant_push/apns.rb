require "pushmeup"
APNS2 = APNS.clone

module MultitenantPush
  module APNS
    include APNS2

    def self.send_notification(device_token, message)
      self.load_credentials()
      APNS2.send_notification(device_token, message)
    end

    def self.send_notifications(notifications)
      self.load_credentials()
      APNS2.send_notifications(notifications)
    end

    def self.feedback
      self.load_credentials()
      APNS2.feedback
    end

    def self.methods
      APNS2.methods
    end
    
    def self.method_missing(method, *args, &block)
      APNS2.send method, *args
    end


    def self.load_credentials
      raise NoTenant if Tenant.current_tenant.nil?
      credentials = Credential.first
      raise NoTenantCredentials if credentials.nil? || credentials.apns_host.blank? || credentials.apns_pass.blank?

      APNS.host = credentials.apns_host
      APNS.pass = credentials.apns_pass
      APNS.pem = "lib/#{Tenant.current_tenant.name}.pem"

    end

    

  end

end