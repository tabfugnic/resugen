class Activity
  include Mongoid::Document
  include Mongoid::Timestamps
 
  field :summary, type: String
  field :title, type: String
  field :name, type: String
  field :begin_date, type: Date
  field :end_date, type: Date
  
  validates_presence_of :name, :begin_date
  validate :end_date_is_not_before_begin_date, 
           :begin_date_is_not_in_the_future

  embeds_many :details
  embedded_in :user
  has_one :address

  accepts_nested_attributes_for :details, :address

  ##
  # Ending Method
  #
  # Prettify the way end_date looks. Display "Present"
  # when nil or greater than today's date.
  ##
  def ending
    if end_date == nil or end_date > Date.today
      return "Present"
    else
      return end_date
    end
  end

  def self.inherited(child)
    child.instance_eval do
      def model_name
        Activity.model_name
      end
    end
    super
  end



  # Validation method
  def end_date_is_not_before_begin_date
    errors.add(:end_date, "can't be before the begin_date") if end_date < begin_date
  end

  # Validation method  
  def begin_date_is_not_in_the_future
    errors.add(:begin_date, "can't be in the future") if begin_date > Date.today
  end
  
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
