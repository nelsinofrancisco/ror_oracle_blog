module ApplicationHelper
  def format_user_name(name)
    adjusted_name = name.ljust(11)
    adjusted_name.truncate(11)
  end
end
