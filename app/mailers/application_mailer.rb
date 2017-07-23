class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def app_name
    Rails.application.class.parent_name.gsub(/(?<n>[A-Z])/, ' \k<n>') .sub(" ", "")
  end
end
