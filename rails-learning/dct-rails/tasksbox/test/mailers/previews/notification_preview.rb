# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification/completed
  def completed
    Notification.completed
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification/incomplete
  def incomplete
    Notification.incomplete
  end

end
