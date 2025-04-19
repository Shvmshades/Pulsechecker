module Types
  class InterventionType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :description, String
    field :status, String
    field :user, Types::UserType, null: true
  end
end
