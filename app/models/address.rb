class Address
  include Mongoid::Document
  include Mongoid::Timestamps
 
  field :address1, type: String
  field :address2, type: String
  field :city, type: String
  field :country, type: String
  field :state, type: String

  field :zip_code, type: Integer
  
  validates_presence_of :city, :country

  belongs_to :user
  belongs_to :activity
end
