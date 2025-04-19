module Mutations
  class CreateUser < BaseMutation
    # Define input arguments
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :role, String, required: false

    # Define return fields
    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(name:, email:, password:, role: nil)
      user = User.new(name: name, email: email, password: password, role: role)

      if user.save
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
