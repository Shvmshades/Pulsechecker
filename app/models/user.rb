class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  field :name,           type: String
  field :email,          type: String
  field :password_digest, type: String
  field :role,           type: String # e.g., 'admin', 'member'

  has_secure_password

  has_and_belongs_to_many :teams
  has_many :pulse_checks
  has_many :interventions, dependent: :destroy
end
