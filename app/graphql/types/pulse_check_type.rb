# app/graphql/types/pulse_check_type.rb
module Types
  class PulseCheckType < Types::BaseObject
    field :id, ID, null: false
    field :score, Integer, null: true
    field :note, String, null: true
    field :checked_at, GraphQL::Types::ISO8601DateTime, null: true
    field :user, Types::UserType, null: false
    field :team, Types::TeamType, null: false
  end
end
