class Serverprovider < ActiveRecord::Base
  attr_accessible :provider_name, :state, :plane
  has_many :numberdetails
end
