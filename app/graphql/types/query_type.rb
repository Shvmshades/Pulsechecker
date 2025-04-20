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
    
    field :teams, [TeamType], null: false

    def teams
      Team.all
    end

    # Optionally, you can also add a query to get a single team by ID:
    field :team, TeamType, null: true do
      argument :id, ID, required: true
    end

    def team(id:)
      Team.find(id)
    end

    field :pulse_checks, [Types::PulseCheckType], null: false

    def pulse_checks
      PulseCheck.all
    end
  end
end
