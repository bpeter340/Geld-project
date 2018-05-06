class Contact < MailForm::Base
attribute :name,      :validate => true
attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
attribute :message,    :validate => true
attribute :subject,    :validate => false


# Declare the e-mail headers. It accepts anything the mail method
# in ActionMailer accepts.
def headers
  {
    :subject => "Geld-Support Form",
    :to => "kobe@rouxbe.com",
    :from => %("#{name}" <#{email}>)
  }
end
end
