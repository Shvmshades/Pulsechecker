module Types
  class TeamType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :user, Types::UserType, null: true
  end
end
