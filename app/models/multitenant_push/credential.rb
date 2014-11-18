module MultitenantPush
  class Credential < ActiveRecord::Base
    acts_as_tenant
  end
end
