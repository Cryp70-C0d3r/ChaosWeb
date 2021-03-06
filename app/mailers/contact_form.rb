class ContactForm < MailForm::Base
  attributes :name,  :validate => true
  attributes :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attributes :message
  attribute :tel
  attribute :nickname,  :captcha  => true

  def headers
    {
        :subject => "ChaosW3b Online Form",
        :to => "chaosw3b@gmail.com",
        :from => %("#{name}" <#{email}>)
    }
  end
end
