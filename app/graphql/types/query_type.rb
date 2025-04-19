# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :users, [UserType], null: false

    def users
      User.all
    end

    field :interventions, [InterventionType], null: false

    def interventions
      Intervention.all
    end
  end
end
