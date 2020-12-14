class ApplicationMailer < ActionMailer::Base
  default to: 'info@bandlists.com', from: 'info@bandlists.com'
  layout 'mailer'
end
