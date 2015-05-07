module ActivityLogs
  def create_activity user_id, target_id, action
    Activity.create! user_id: user_id, target_id: target_id, action: action
  end
end