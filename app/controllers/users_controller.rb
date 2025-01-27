class UsersController < ApplicationController
  def index
    @matching_users = User.all
    @list_of_users = @matching_users.order({ :username => :asc })

    render( :template => "user_templates/index")
  end

  def show
    input_username = params.fetch("path_username")
    @the_user = User.find_by(:username => input_username)
    # Can also use .where
    # @the_user = User.where({ :username => input_username })
    render( :template => "user_templates/show")
  end
end
