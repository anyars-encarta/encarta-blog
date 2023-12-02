class Ability
  include CanCan::Ability

  def initialize(user)
    # If the user is an admin, they can delete any post.
    if user.has_role?('admin')
      can :delete, Post
    end

    # If the post belongs to the user, they can delete it.
    if user.id == post.user_id
      can :delete, post
    end
  end
end