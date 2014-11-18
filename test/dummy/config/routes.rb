Rails.application.routes.draw do

  mount MultitenantPush::Engine => "/multitenant_push"
end
