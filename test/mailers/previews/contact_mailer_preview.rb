# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_email
    ContactMailer.contact_email("zemaria@gandaze.com",
      "Ze maria", "1234567890", @message = "Hello")
  end
end
