class Detail
  include Mongoid::Document
  
  field :content, type: String

  embedded_in :activity
end
