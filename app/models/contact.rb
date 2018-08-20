class Contact <MailForm::Base
    attribute :name,      :validate => true
    attribute :email,     :validate => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    attribute :message,   :validate => true
    attribute :nickname,  :captcha => true

    def headers 
        {
        :subject => "Contact Form",
        :to => "mariuszdam@yahoo.com",
        :from => %("#{name}" <#{email}>)
        }
    end
end