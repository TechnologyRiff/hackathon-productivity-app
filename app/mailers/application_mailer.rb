class ApplicationMailer < ActionMailer::Base
  include SendGrid
  default from: "cnhack2016@gmail.com"
  layout 'mailer'
end
