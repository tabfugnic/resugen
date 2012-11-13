class Activity
  include Mongoid::Document
  include Mongoid::Timestamps
 
  field :summary, type: String
  field :title, type: String
  field :name, type: String
  field :begin_date, type: Date
  field :end_date, type: Date
  
  validates_presence_of :name, :begin_date

  embeds_many :details
  embedded_in :user
  has_one :address

  accepts_nested_attributes_for :details, :address
  
end

class Education < Activity
  field :score, type: BigDecimal
  field :max_score, type: BigDecimal, default: 4.0
end

class Employment < Activity

end

class Volunteer < Activity

end

class Personal < Activity

end

class Art < Activity

end

class Project < Activity

end
