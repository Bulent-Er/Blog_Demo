class ApplicationController < ActionController::Base
  before_action :set_notifications, if: :current_user

  def set_notifications
    notification = Notification.where(recipient: current_user).newest_first.limit(9)
    @unread = notification.unread
    @read   = notification.read
  end
end
