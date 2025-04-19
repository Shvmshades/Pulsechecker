module Mutations
  class DeleteUser < BaseMutation
    argument :id, ID, required: true

    field :message, String, null: false
    field :errors, [String], null: false

    def resolve(id:)
      user = User.find(id)
      if user.destroy
        {
          message: "User deleted successfully",
          errors: []
        }
      else
        {
          message: "",
          errors: user.errors.full_messages
        }
      end
    rescue Mongoid::Errors::DocumentNotFound
      {
        message: "",
        errors: ["User not found"]
      }
    end
  end
end
