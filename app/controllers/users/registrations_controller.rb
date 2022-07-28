class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private
  
  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register failed
  end

  def register_success
    render json: {
      message: 'Successfully Registered',
      user: current_user
    }, status: :ok
  end

  def register_failed
    render json: { message: 'There was an error with Registration'}, status: :unprocessable_entity
  end

end