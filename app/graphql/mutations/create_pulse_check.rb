# app/graphql/mutations/create_pulse_check.rb
module Mutations
  class CreatePulseCheck < BaseMutation
    argument :score, Integer, required: true
    argument :note, String, required: false
    argument :checked_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :user_id, ID, required: true
    argument :team_id, ID, required: true

    field :pulse_check, Types::PulseCheckType, null: true
    field :errors, [String], null: false

    def resolve(score:, note: nil, checked_at: nil, user_id:, team_id:)
      pulse_check = PulseCheck.new(
        score: score,
        note: note,
        checked_at: checked_at || Time.now,
        user_id: user_id,
        team_id: team_id
      )

      if pulse_check.save
        { pulse_check: pulse_check, errors: [] }
      else
        { pulse_check: nil, errors: pulse_check.errors.full_messages }
      end
    end
  end
end
