module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String
    field :role, String
    field :interventions, [Types::InterventionType], null: true
  end
end
