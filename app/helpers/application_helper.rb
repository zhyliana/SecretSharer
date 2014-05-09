module ApplicationHelper
  def can_unfriend?(friend)
    (current_user.in_friends.include?(friend) ||
    current_user.out_friends.include?(friend))
  end
end
