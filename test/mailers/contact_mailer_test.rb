require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "should return contact email" do
    mail = ContactMailer.contact_email("zemaria@gandaze.com",
      "Ze Maria", "1234567890", @message = "Hello")
    assert_equal ['info@bandlists.com'], mail.to
    assert_equal ['info@bandlists.com'], mail.from
  end

end
