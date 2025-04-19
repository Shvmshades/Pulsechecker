module Mutations
  class UpdateUser < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :email, String, required: false
    argument :password, String, required: false
    argument :role, String, required: false

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(id:, **attributes)
      user = User.find(id)
      if user.update(attributes.compact)
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    rescue Mongoid::Errors::DocumentNotFound
      { user: nil, errors: ["User not found"] }
    end
  end
end
