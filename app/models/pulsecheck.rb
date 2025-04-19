# app/models/pulse_check.rb
class PulseCheck
  include Mongoid::Document
  include Mongoid::Timestamps

  field :score, type: Integer
  field :note, type: String
  field :checked_at, type: DateTime

  belongs_to :user
  belongs_to :team
end
