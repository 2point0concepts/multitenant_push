require "multitenant_push/engine"
require "multitenant_push/apns"

module MultitenantPush
  class NoTenantCredentials < Exception; end
  class NoTenant < Exception; end
end
