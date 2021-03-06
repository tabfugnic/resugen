class Activity
  include Mongoid::Document
  include Mongoid::Timestamps
 
  field :summary, type: String
  field :title, type: String
  field :name, type: String
  field :begin_date, type: Date
  field :end_date, type: Date
  field :_address_id, type: Moped::BSON::ObjectId
  
  validates_presence_of :name, :begin_date
  validate :end_date_is_not_before_begin_date, 
           :begin_date_is_not_in_the_future

  embeds_many :details
  embedded_in :user

  accepts_nested_attributes_for :details

  ##
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

  ##
  # Make sure all child instances report 
  # coming from activity
  ##
  def self.inherited(child)
    child.instance_eval do
      def model_name
        Activity.model_name
      end
    end
    super
  end

  ##
  # Assign address to activity from user
  ##
  def address=(address)
    address = user.addresses.create(address) unless address.is_a? Address
    update_attribute(:_address_id, address._id)
  end 

  ##
  #  Return referenced user address
  ##
  def address
    user.addresses.find(_address_id) if _address_id
  end

  protected
  # Validation method
  def end_date_is_not_before_begin_date
    return unless end_date.present?
    errors.add(:end_date, "can't be before the begin_date") if end_date < begin_date
  end

  # Validation method  
  def begin_date_is_not_in_the_future
    return unless begin_date.present?
    errors.add(:begin_date, "can't be in the future") if begin_date > Date.today
  end
  
end
