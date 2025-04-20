# app/graphql/mutations/create_intervention.rb
module Mutations
  class CreateIntervention < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :status, String, required: true
    argument :user_id, ID, required: true

    field :intervention, Types::InterventionType, null: true
    field :errors, [String], null: false

    def resolve(title:, description: nil, status: nil, user_id:)
      intervention = Intervention.new(
        title: title,
        description: description,
        status: status,
        user_id: user_id,
      )

      if intervention.save
        { intervention: intervention, errors: [] }
      else
        { intervention: nil, errors: intervention.errors.full_messages }
      end
    end
  end
end
