class Intervention
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title,       type: String
  field :description, type: String
  field :status,      type: String  # e.g., 'pending', 'in-progress', 'completed'

  belongs_to :user
end
