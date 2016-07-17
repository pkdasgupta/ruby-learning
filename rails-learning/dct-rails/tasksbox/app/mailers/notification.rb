class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.completed.subject
  #
  def completed(task,user)
    @task = task
    @user = user

    #mail to: "#{task.project.client.email}", subject: "#{task.title} is Marked Completed"
    mail to: "connect2pkd@gmail.com", subject: "#{task.title} is Marked Completed"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.incomplete.subject
  #
  def incomplete
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
