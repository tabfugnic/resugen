class Address
  include Mongoid::Document
  include Mongoid::Timestamps
 
  field :address1, type: String
  field :address2, type: String
  field :city, type: String
  field :country, type: String
  field :state, type: String
  field :home, type: Boolean

  field :zip_code, type: Integer
  
  validates_presence_of :city, :country

  embedded_in :user

end
