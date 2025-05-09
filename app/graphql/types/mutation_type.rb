module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :delete_user, mutation: Mutations::DeleteUser

    field :create_team, mutation: Mutations::CreateTeam

    field :create_pulse_check, mutation: Mutations::CreatePulseCheck
    field :create_intervention, mutation: Mutations::CreateIntervention
  end
end