module ProjectsHelper
  def application_number
    Application.where("created_at > ? AND user_id != ?", current_user.last_sign_in_at, current_user.id).count
  end
end
