# app/graphql/mutations/create_team.rb
module Mutations
  class CreateTeam < BaseMutation
    argument :name, String, required: true

    field :team, Types::TeamType, null: true
    field :errors, [String], null: false

    def resolve(name:)
      team = Team.new(name: name)

      if team.save
        { team: team, errors: [] }
      else
        { team: nil, errors: team.errors.full_messages }
      end
    end
  end
end
