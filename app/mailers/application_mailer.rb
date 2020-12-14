class ApplicationMailer < ActionMailer::Base #model for the mailer
  default to: 'info@bandlists.com', from: 'info@bandlists.com'
  layout 'mailer'
end
