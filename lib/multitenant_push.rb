require "multitenant_push/engine"
require "multitenant_push/apns"
require "multitenant_push/gcm"

module MultitenantPush
  class NoTenantCredentials < Exception; end
  class NoTenant < Exception; end
end
